class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :verify_authenticity_token, only: :facebook

  def google_oauth2
    # You need to implement the method below in your model (app/models/user.rb)
    @user = get_user_google_oauth2
    if @user.persisted?
      flash[:notice] =
        I18n.t "devise.omniauth_callbacks.success", kind: "Google"
      sign_in_and_redirect @user, event: :authentication
    else
      # Removing extra as it can overflow some session stores
      session["devise.google_data"] =
        request.env["omniauth.auth"].except("extra")
      redirect_to new_user_registration_url,
                  alert: @user.errors.full_messages.join("\n")
    end
  end

  def facebook
    # You need to implement the method below in your model (app/models/user.rb)
    @user = User.from_omniauth_facebook(request.env["omniauth.auth"])
    if @user.persisted?
      # this will throw if @user is not activated
      sign_in_and_redirect @user, event: :authentication
      if is_navigational_format?
        set_flash_message(:notice, :success,
                          kind: "Facebook")
      end
    else
      # Removing extra as it can overflow some session stores
      session["devise.facebook_data"] =
        request.env["omniauth.auth"].except(:extra)
      redirect_to new_user_registration_url
    end
  end

  private

  def get_user_google_oauth2
    User.from_omniauth_google(request.env["omniauth.auth"])
  end
end
