class UsersController < ApplicationController

  #before_action :after_sign_out_path_for
  def new
  end

  def index
    @users= User.all
    @user= current_user
    @book= Book.new
  end


  def show
    #binding.pry
    @user= User.find(params[:id])
    @book= Book.new
    @books= @user.books
  end

  def edit
    @user=User.find(params[:id])
    if @user == current_user
      render :edit
    else
    redirect_to user_path(current_user)
    end
  end

  def update
     @user=User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]="user was successfully created."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

private


  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end