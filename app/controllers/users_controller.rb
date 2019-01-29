class UsersController < ApplicationController
  def index
    # render plain: "I'm in the index action!"
    users = User.all
    render json: users
  end

  def create
    # render json: params 
    user = User.new(user_params)
    
    #does user.save actually run? if only present in conditional statement - Yes
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    user = User.find(params[:id])

    render json: user 
  end 

  def update
    user = User.find(params[:id])

    if user.update(user_params)
      render json: user 
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end 
  end 

  def destroy
    user = User.find(params[:id])

    user.destroy

    render json: user 
  end 

  private
  def user_params
    #does :user refer to our class? No - refers to our user key (used for nesting)
    params.require(:user).permit(:username, :email)
  end
end
