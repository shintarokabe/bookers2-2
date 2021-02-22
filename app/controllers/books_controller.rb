class BooksController < ApplicationController

def new
  @book = Book.new
end

def create
  @booknew = Book.new(book_params)
  @booknew.user_id = current_user.id
  if @booknew.save
    redirect_to books_path, notice: "You have created book successfully."
  else
    render :index, notice: "You have something error!"
  end
end

def index
  #@books = Book.all
  @booknew = Book.new
  @books = Book.page(params[:page]).reverse_order
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
    redirect_to books_path, notice: "You have updated book successfully."
   else
    render :edit, notice: "You have something error!"
   end
end

private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
