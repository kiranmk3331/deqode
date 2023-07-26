class ReviewsController < ApplicationController
  before_action :find_book, only: [:store, :new, :index]

  def new
    @review = Review.new
  end


  def create
    @review = Review.new(review_params)
    @review.book_id = @book.id

    if @review.save
      redirect_to book_review_path(@book, @review), notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  def index
    @reviews = @book.reviews
  end


  private

  def find_book
    @book = Book.find(params[:book_id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
