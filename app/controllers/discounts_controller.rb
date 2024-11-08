class DiscountsController < ApplicationController
  before_action :set_discount, only: %i(show edit update destroy)

  # GET /discounts or /discounts.json
  def index
    @discounts = Discount.all
  end

  # GET /discounts/1 or /discounts/1.json
  def show; end

  # GET /discounts/new
  def new
    @discount = Discount.new
  end

  # GET /discounts/1/edit
  def edit; end

  # POST /discounts or /discounts.json
  def create
    @discount = Discount.new(discount_params)

    if @discount.save
      redirect_to discount_url(@discount),
                  notice: "Discount was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /discounts/1 or /discounts/1.json
  def update
    if @discount.update(discount_params)
      redirect_to discount_url(@discount),
                  notice: "Discount was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /discounts/1 or /discounts/1.json
  def destroy
    @discount.destroy

    redirect_to discounts_url, notice: "Discount was successfully destroyed."
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_discount
    @discount = Discount.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def discount_params
    params.require(:discount).permit(:product_id, :user_id, :discount_rate,
                                     :status, :start_time, :end_time)
  end
end
