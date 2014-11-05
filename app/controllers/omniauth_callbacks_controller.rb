class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  skip_before_filter :authenticate_user!

  def all
    p env['omniauth.auth']
    player = Player.from_omniauth(env['omniauth.auth'], current_player)
    if player.persisted?
      flash[:notice] = 'Seja bem vindo(a) ao SHOW DO MILHÃO!'
      sign_in_and_redirect(player)
    else
      session['devise.user_attributes'] = player.attributes
      redirect_to new_user_registration_url
    end
  end

  def failure
    #handle you logic here..
    #and delegate to super.
    super
  end

  alias_method :facebook, :all
  alias_method :twitter, :all
end
