class UsersController < ApplicationController
  before_action :authorized, only:[:auto_login]
  # Register
  def create
    @user = User.create(user_params)
      if @user.valid
        token = encode_token({ user_id: @user.id })
        render json: { user: @user, token: token }
      else
        render json: { error: 'invalid username or password' }
      end
  end

  # logging in
  def login
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: token }
    else
      render json: {error: 'invalid username or password'}
    end
  end

  # checking if a user is logged in still
  def auto_login
    render json: @user
  end

  private

  def user_params
    params.permit(:username, :password, :age)
  end
end
