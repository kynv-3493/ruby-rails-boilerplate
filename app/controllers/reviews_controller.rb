class ReviewsController < ApplicationController
  before_action :set_review, only: %i[ show edit update destroy ]

  # GET /reviews
  def index
    @reviews = Review.all
  end

  # GET /reviews/1 o
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  def create
    @review = Review.new(review_params)

    respond_to do |format|
      if @review.save
        redirect_to review_url(@review), notice: "Review was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /reviews/1 o
  def update
    respond_to do |format|
      if @review.update(review_params)
        redirect_to review_url(@review), notice: "Review was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  # DELETE /reviews/1 o
  def destroy
    @review.destroy

    respond_to do |format|
      redirect_to reviews_url, notice: "Review was successfully destroyed."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:user_id, :rating, :comment, :image_url)
    end
end
