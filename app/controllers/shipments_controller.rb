class ShipmentsController < ApplicationController
  before_action :set_shipment, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:show, :index]

  # GET /shipments
  # GET /shipments.json
  def index
    @shipments = Shipment.all
  end

  # GET /shipments/1
  # GET /shipments/1.json
  def show
  end

  # GET /shipments/new
  def new
    @shipment = Shipment.new
  end

  # GET /shipments/1/edit
  def edit
  end

  # POST /shipments
  # POST /shipments.json
  def create
    @shipment = Shipment.new(shipment_params)
    @shipment.user = current_user

    respond_to do |format|
      if @shipment.save
        format.html { redirect_to({:action => "index"}, {:notice => "Shipment was successfully created"})}
        format.json { render action: 'show', status: :created, location: @shipment }
        flash[:error] = @shipment.errors.full_messages.join(' ')
      else
        format.html { render action: 'new' }
        format.json { render json: @shipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shipments/1
  # PATCH/PUT /shipments/1.json
  def update
    respond_to do |format|
      if @shipment.update(shipment_params)
        format.html { redirect_to({:action => "index"}, {:notice => "Shipment was successfully updated"})}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @shipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shipments/1
  # DELETE /shipments/1.json
  def destroy
    @shipment.destroy
    respond_to do |format|
      format.html { redirect_to shipments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipment
      @shipment = Shipment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shipment_params
      params.require(:shipment).permit(:pieces_count, :gross_weight_lbs, :gross_volume_cuft, :equiptype, :wt_util, :cb_util, :user_id, :equipment_id, {
      pieces_attributes: [:id, :count, :length_ins, :width_ins, :height_ins, :stackability, :weight_lbs, :volume_cuft, :shipment_id, :piece_name, :_destroy]}, {
      equipment_attributes: [:id, :equip_name, :wt_limit_lbs, :length1_ins, :width1_ins, :height1_ins]}, {
      users_attributes: [:id]}
      )
    end
end
