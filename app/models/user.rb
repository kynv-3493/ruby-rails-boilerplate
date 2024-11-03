class User < ApplicationRecord
  devise :database_authenticatable, :async, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable,
         :omniauthable, omniauth_providers: %i(facebook google_oauth2)

  def admin?
    true
  end

  class << self
    def from_omniauth_google access_token
      data = access_token.info
      # data = {
      #   "name" => "Ky Nguyen Van",
      #   "email" => "luffy3042001@gmail.com",
      #   "unverified_email" => "luffy3042001@gmail.com",
      #   "email_verified" => true,
      #   "first_name" => "Ky",
      #   "last_name" => "Nguyen Van",
      #   "image" => "https://lh3.googleusercontent.com/a/ACg8ocJaL1mnGakbptc4SVKAWigY9f-VNmc1SHiraDCLQGXP-scMzQ=s96-c"
      # }

      User.find_or_create_by(email: data.email) do |user|
        user.email = data.email
        user.password = Devise.friendly_token[0, 20]
        user.provider = "google_oauth2"
        # user.user_name = data.user_name
      end
    end

    def from_omniauth_facebook auth
      # auth = {
      #   "provider" => "facebook",
      #   "uid" => "1068475",
      #   "info" =>
      # {
      #   "email" => "dsitweed@gmail.com",
      #   "name" => "Nguyen Van Ky",
      #   "image" =>
      #   "https://graph.facebook.com/v19.0/1068475661578806/picture?access_token=EAAFAtHZB4vqsBOyJOW3V"
      # },
      #   "credentials" =>
      # {
      #   "token" =>
      #   "EAAFAtHZB4vqsBOyJOW3V2KBnvj",
      #   "expires_at" => 1_730_884_830,
      #   "expires" => true
      # },
      #   "extra" => {
      #     "raw_info" => {
      #       "name" => "Nguyen Van Ky",
      #       "email" => "dsitweed@gmail.com",
      #       "id" => "10684756"
      #     }
      #   }
      # }

      find_or_create_by(email: auth.info.email) do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0, 20]
        user.provider = "facebook"
        # user.username = auth.info.name
        # user.image = auth.info.image # assuming the user model has an image
        # If you are using confirmable and the provider you use validate emails,
        # uncomment the line below to skip the confirmation emails.
        # user.skip_confirmation!
      end
    end
  end
end
