class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
    @review = Review.new
    @reviews = @list.reviews
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save ? redirect_to(list_path(@list)) : render(:new, status: :unprocessable_entity)
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    @list.photo.purge
    redirect_to lists_path
  end

  private

  def list_params
    params.require('list').permit(:name, :photo)
  end
end
