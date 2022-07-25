class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:id])

    @comment = current_user.book_comments.new(book_comment_params)
    @comment.book_id = @book.id
    if @comment.save
      flash[:notice]="You have created book successfully."
      redirect_to book_path(@book.id)
    else
    flash[:notice]="error."
    @user=current_user
    @book_new = Book.new
    @book_comment=BookComment.new
      render template: "books/show"
    end
  end

  def destroy
    @book_book_comment = Book_comment.find_by(user_id: current_user.id, book_id: params[:book_id])
    @book_book_comment.destroy
  redirect_to books_path

  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)

  end
end