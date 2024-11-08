class CartsController < ApplicationController
  before_action :set_cart, only: %i[ show edit update destroy ]

  # GET /carts or /carts.json
  def index
    @carts = Cart.all
  end

  # GET /carts/1 or /carts/1.json
  def show
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts or /carts.json
  def create
    @cart = Cart.new(cart_params)

    if @cart.save
      redirect_to cart_url(@cart), notice: "Cart was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /carts/1 or /carts/1.json
  def update
    if @cart.update(cart_params)
      redirect_to cart_url(@cart), notice: "Cart was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /carts/1 or /carts/1.json
  def destroy
    @cart.destroy

    redirect_to carts_url, notice: "Cart was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_params
      params.require(:cart).permit(:user_id)
    end
end
