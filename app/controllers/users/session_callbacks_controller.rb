module Users
  class SessionCallbacksController < Devise::OmniauthCallbacksController
    def facebook
      auth_data = request.env["omniauth.auth"]
      @user = User.find_from_omniauth(auth_data) || User.create_from_omniauth(auth_data)
      sign_in_and_redirect @user
    end
  end
end
