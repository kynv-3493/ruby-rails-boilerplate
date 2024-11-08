class CartItemsController < ApplicationController
  before_action :set_cart_item, only: %i[ show edit update destroy ]

  # GET /cart_items or /cart_items.json
  def index
    @cart_items = CartItem.all
  end

  # GET /cart_items/1 or /cart_items/1.json
  def show
  end

  # GET /cart_items/new
  def new
    @cart_item = CartItem.new
  end

  # GET /cart_items/1/edit
  def edit
  end

  # POST /cart_items or /cart_items.json
  def create
    @cart_item = CartItem.new(cart_item_params)

    if @cart_item.save
      redirect_to cart_item_url(@cart_item), notice: "Cart item was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cart_items/1 or /cart_items/1.json
  def update
    if @cart_item.update(cart_item_params)
      redirect_to cart_item_url(@cart_item), notice: "Cart item was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /cart_items/1 or /cart_items/1.json
  def destroy
    @cart_item.destroy

    redirect_to cart_items_url, notice: "Cart item was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_item_params
      params.require(:cart_item).permit(:cart_id, :product_id, :quantity)
    end
end
