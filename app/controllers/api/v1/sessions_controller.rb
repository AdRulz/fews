module Api::V1
  class SessionsController < BaseController
    def create
      if authenticate_with_credentials
        render json: current_user, serializer: SessionSerializer
      else
        render json: nil, status: 403
      end
    end

    private

    def authenticate_with_credentials
      user = User.where({email: params[:email]}).first

      if user && user.authenticate(params[:password])
        @current_user = user
      else
        @current_user = nil
      end
    end

  end
end
