class CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:show, :update, :destroy]

  # GET /cart_items
  def index
    @user = User.find params[:user_id]
    @cart_items = @user.cart_items.includes(:product).all
    data = @cart_items.map do |cart_item|
      {
        id: cart_item.id,
        product_id: cart_item.product_id,
        user_id: cart_item.user_id,
        count: cart_item.count,
        product_name: cart_item.product.proname,
        old_price: cart_item.product.old_price,
        new_price: cart_item.product.new_price,
        product_desc: cart_item.product.prodesc,
        img: cart_item.product.img
      }
    end

    render json: data
  end

  # GET /cart_items/1
  def show
    render json: @cart_item
  end

  # POST /cart_items
  def create
    @cart_item = CartItem.new(cart_item_params)

    if @cart_item.save
      render json: @cart_item, status: :created, location: @cart_item
    else
      render json: @cart_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cart_items/1
  def update
    if @cart_item.update(cart_item_params)
      render json: @cart_item
    else
      render json: @cart_item.errors, status: :unprocessable_entity
    end
  end

  def get_cart
    user_id = params[:cart_item][:user_id]
    product_id = params[:cart_item][:product_id]
    cart_item = CartItem.where("user_id = ? AND product_id = ?", user_id, product_id).first
    render json: cart_item
  end

  # DELETE /cart_items/1
  def destroy
    @cart_item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cart_item_params
      params.require(:cart_item).permit(:product_id, :user_id, :count)
    end
end
