module Api::V1
  class AuthController < ApplicationController
    def login
      user = User.find_by(email: params[:email])

      if user&.authenticate(params[:password])
        token = encode_token({ user_id: user.id })
        render json: { user: user, token: token }, status: :ok
      else
        render json: { error: "Invalid email or password" }, status: :unauthorized
      end
    end

    def profile
      render json: current_user
    end

    private

    def encode_token(payload)
      JWT.encode(payload, Rails.application.config.secret_key_base)
    end

    def decoded_token
      auth_header = request.headers["Authorization"]
      if auth_header
        token = auth_header.split(" ")[1]
        begin
          JWT.decode(token, Rails.application.config.secret_key_base, true, algorithm: "HS256")
        rescue JWT::DecodeError
          nil
        end
      end
    end

    def current_user
      if decoded_token
        user_id = decoded_token[0]["user_id"]
        @current_user ||= User.find_by(id: user_id)
      end
    end
  end
end
