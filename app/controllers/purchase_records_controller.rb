class PurchaseRecordsController < ApplicationController
  before_action :item_record

  def index
    @purchase_record_destination = PurchaseRecordDestination.new
  end

  def create
    @purchase_record_destination = PurchaseRecordDestination.new(purchase_record_params)
    if @purchase_record_destination.valid?
      @purchase_record_destination.save
      redirect_to item_purchase_records_path
    else
      render :index
    end
  end

  private 

  def purchase_record_params
    params.require(:purchase_record_destination).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :purchase_record_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def item_record
    @item = Item.find(params[:item_id])
  end

end
