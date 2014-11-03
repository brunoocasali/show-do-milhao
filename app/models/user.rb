class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :omniauthable

  validates_presence_of :email

  has_many :authorizations, :dependent => :destroy

  def has_authorizations?
    true if authorizations.count.to_i > 0
  end

  def self.new_with_session(params, session)
    if session['devise.user_attributes']
      new(session['devise.user_attributes'], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def self.from_omniauth(auth, current_user)
    authorization = Authorization.where(:provider => auth.provider,
                                        :uid => auth.uid.to_s,
                                        :token => auth.credentials.token,
                                        :secret => auth.credentials.secret).first_or_initialize
    if authorization.user.blank?

      #The Twitter provider doesn't gives me the email.
      mail = (auth.provider.eql? 'twitter') ? auth.uid + '@twitter.com' : auth.info.email

      user = current_user.nil? ? User.where('email = ?', mail).first : current_user
      if user.blank?
        user = User.new
        user.password = Devise.friendly_token[0, 20]
        user.name = auth.info.name
        user.email = mail
        user.save!
      end

      authorization.username = auth.info.nickname
      authorization.user_id = user.id
      authorization.save
    end
    authorization.user
  end
end