class M::PaymentMethodsController < ApplicationController
  before_action :set_m_payment_method, only: %i[ show edit update destroy ]

  # GET /m/payment_methods or /m/payment_methods.json
  def index
    @m_payment_methods = M::PaymentMethod.all
  end

  # GET /m/payment_methods/1 or /m/payment_methods/1.json
  def show
  end

  # GET /m/payment_methods/new
  def new
    @m_payment_method = M::PaymentMethod.new
  end

  # GET /m/payment_methods/1/edit
  def edit
  end

  # POST /m/payment_methods or /m/payment_methods.json
  def create
    @m_payment_method = M::PaymentMethod.new(m_payment_method_params)

    if @m_payment_method.save
      redirect_to m_payment_method_url(@m_payment_method), notice: "Payment method was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /m/payment_methods/1 or /m/payment_methods/1.json
  def update
    if @m_payment_method.update(m_payment_method_params)
      redirect_to m_payment_method_url(@m_payment_method), notice: "Payment method was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /m/payment_methods/1 or /m/payment_methods/1.json
  def destroy
    @m_payment_method.destroy

    redirect_to m_payment_methods_url, notice: "Payment method was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_m_payment_method
      @m_payment_method = M::PaymentMethod.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def m_payment_method_params
      params.require(:m_payment_method).permit(:name)
    end
end
