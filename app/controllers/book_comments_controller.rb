class BookCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = book.id
    comment.save
    redirect_to request.referer
  end
  
  def destroy
    # book = Book.find(params[:book_id])
    # comment = current_user.book_comments.find_by(book_comment_params)
    # comment.destroy
    # redirect_to books_path
    BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    redirect_to request.referer
  end 
  
  private
  def book_comment_params
    params.require(:book_comment).permit(:comment)
    
  end
end
