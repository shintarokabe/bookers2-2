class BooksController < ApplicationController
 before_action :authenticate_user!
 before_action :correct_user, {only:[:edit, :update]}

def new
  @book = Book.new
end

def create
  @books = Book.all
  @book = Book.new(book_params)
  @book.user_id = current_user.id
  if @book.save
    redirect_to book_path(@book.id), notice: "You have created book successfully."
  else
    @user = current_user
    flash.now[:alert] = "You have something error!"
    render :index
  end
end

def index
  @books = Book.all
  @book = Book.new
  @user = current_user
end

def show
  @book = Book.find(params[:id])
  @user = @book.user
  @booknew = Book.new
end

def destroy
  @book = Book.find(params[:id])
  @book.destroy
  redirect_to books_path
end

def edit
  @book = Book.find(params[:id])
end

def update
  @book = Book.find(params[:id])
   if @book.update(book_params)
    redirect_to book_path(@book.id), notice: "You have updated book successfully."
   else
    render :edit, notice: "You have something error!"
   end
end

private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def correct_user
    @book = Book.find(params[:id])
    if current_user.id != @book.user_id
      redirect_to books_path
    end
  end



end
