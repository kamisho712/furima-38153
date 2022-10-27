class PurchaseRecordsController < ApplicationController
  before_action :item_record
  before_action :authenticate_user!
  def index
    @purchase_record_destination = PurchaseRecordDestination.new
    if @item.user_id == current_user.id || @item.purchase_record != nil
      redirect_to root_path
    end
  end

  def create
    @purchase_record_destination = PurchaseRecordDestination.new(purchase_record_params)
    if @purchase_record_destination.valid?
      pay_item
      @purchase_record_destination.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private 

  def purchase_record_params
    params.require(:purchase_record_destination).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def item_record
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: purchase_record_params[:token],
      currency: 'jpy'
    )
  end

end
