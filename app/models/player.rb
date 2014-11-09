class Player < ActiveRecord::Base
  devise :rememberable, :trackable, :validatable, :omniauthable

  has_many :authorizations, dependent: :destroy
  has_many :games, dependent: :destroy
  
  def has_authorizations?
    true if authorizations.count.to_i > 0
  end

  def self.new_with_session(params, session)
    if session['devise.user_attributes']
      new(session['devise.user_attributes'], without_protection: true) do |player|
        player.attributes = params
        player.valid?
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
    if authorization.player.blank?

      # The Twitter provider doesn't gives me the email.
      mail = (auth.provider.eql? 'twitter') ? auth.uid + '@twitter.com' : auth.info.email

      player = current_user.nil? ? Player.where('email = ?', mail).first : current_user
      if player.blank?
        player = Player.new
        player.password = Devise.friendly_token[0, 20]
        player.name = auth.info.name
        player.email = mail
        player.save!
      end

      authorization.username = auth.info.name
      authorization.player_id = player.id
      authorization.save
    end
    authorization.player
  end
end