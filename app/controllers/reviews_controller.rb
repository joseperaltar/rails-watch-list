class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @list = List.find(params[:list_id])
    @review.list = @list
    @reviews = @list.reviews
    @bookmark = Bookmark.new

    @review.save ? redirect_to(list_path(@list)) : render('lists/show', status: :unprocessable_entity)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to list_path(@review.list), status: :see_other
  end

  private

  def review_params
    params.require('review').permit(:content, :rating)
  end
end
