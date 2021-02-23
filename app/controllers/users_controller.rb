class UsersController < ApplicationController
 before_action :authenticate_user!
 before_action :correct_user, {only:[:edit, :update]}

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
    @users = User.all
    # @books = Book.all
    # @books = User.find(params[:id])
    # # @books =page(params[:page]).reverse_order
    @book = Book.new
  end

  def edit
  #   if @user.id = current_user.id
  #   @user = User.find(params[:id])
  #   else
  #   redirect_to user_path(@user.id)
  # end
  @user = User.find(params[:id])
  end

  def update
  @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      flash.now[:alert] = "You have something error!"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def correct_user
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to user_path(current_user)
    end
  end

end
