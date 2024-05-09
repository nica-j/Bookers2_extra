class FavoritesController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @favorite = current_user.favorites.new(book_id: @book.id)
    @favorite.save
    # 非同期化する場合は、JavaScriptファイル（.js.erb）を使用してビューを更新するためredirect指示を消す必要がある！
    # redirect_to request.referer
    # redirect_back(fallback_location: root_path)
    # 上のroot_pathの部分は処理に失敗した場合のダイレクト先を指示しているので、好きに任意のpathを指定できる
    # redirect_to request.referer　これでも直前に見てたページを表示できるよ
  end 
  
  def destroy
    @book = Book.find(params[:book_id])
    @favorite = current_user.favorites.find_by(book_id: @book.id)
    @favorite.destroy
    # redirect_to request.referer
    # redirect_back(fallback_location: root_path)
  end 
end
