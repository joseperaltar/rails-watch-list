class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.where(:list_id == params[:list_id])
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list

    @bookmark.save ? redirect_to(list_path(@list)) : render("lists/show", status: :unprocessable_entity)
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), statu: :see_other
  end

  private

  def bookmark_params
    params.require('bookmark').permit(:movie_id, :comment)
  end
end
