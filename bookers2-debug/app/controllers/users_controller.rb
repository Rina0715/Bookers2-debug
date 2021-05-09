class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:update]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def create
    @user = User.new(user_params)
    @user.user_id = current_user.id
    if @user.save
     redirect_to user_path, notice: "User was successfully created."
    else
     render :edit
    end
  end

  def edit
    @user = User.find(params[:id])
     if @user == current_user
     else
       redirect_to user_path(current_user)
     end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      @books = @user.books
      @book = Book.new
      render "edit"
    end
  end

  def following
    @user = User.find(params[:id])
    @users = @user.following
    render 'relationships/follow_form'
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    render 'relationships/follow_form'
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
