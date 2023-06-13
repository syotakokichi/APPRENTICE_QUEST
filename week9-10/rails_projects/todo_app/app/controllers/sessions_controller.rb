class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      token = JWT.encode({ user_id: user.id }, Rails.application.credentials.secret_key_base, 'HS256')
      render json: { user: { email: user.email, token: token } }, status: :created
    else
      render json: { errors: ['Invalid email or password'] }, status: :unauthorized
    end
  end
end
