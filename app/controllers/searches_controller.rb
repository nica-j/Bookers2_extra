class SearchesController < ApplicationController
  def search
    @word = params[:word] #検索ワード
    @model = params[:model] #検索モデルの選択
    @method = params[:method] #キーワードの一致方法選択

    if @model == "user"
      @records = User.search_for(@word, @method)
    else
      @records = Book.search_for(@word, @method)
    end
  end
end
