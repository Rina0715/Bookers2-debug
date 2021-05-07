class BookCommentsController < ApplicationController
  def index
    @new_book = Book.new
    @user = current_user
    @book = Book.find(params[:book_id])
    @book_comments = @book.book_comments
  end

  def create
    @book_comment = BookComment.new(book_comment_params)
    @book_comment.user_id = current_user.id
    @book = Book.find(params[:book_id])
    if @book_comment.save
      redirect_to book_path(@book_comment.book)
    else
      @new_book = Book.new
      @book_comments = @book.book_comments
      render "books/show"
    end
  end

  def destroy
    @book_comment = BookComment.find_by(id: params[:id], book_id: params[:book_id])
    @book_comment.destroy
    redirect_to book_path(@book_comment.book)
  end

  private
  def book_comment_params
    params.permit(:book_id, :content)
  end
end
