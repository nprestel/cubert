class EquipmentController < ApplicationController
  before_action :set_equipment, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:index, :show]
  
  # GET /equipment
  # GET /equipment.json
  def index
    @equipment = Equipment.paginate(:page => params[:page], :per_page => 5)
    respond_to do |format|
      format.html
      format.csv { send_data @equipment.to_csv }
      format.xlsx {render xlsx: 'download', filename: "equipment.xlsx"}
    end
  end

  # GET /equipment/1
  # GET /equipment/1.json
  def show
  end

  # GET /equipment/new
  def new
    @equipment = Equipment.new
  end

  # GET /equipment/1/edit
  def edit
  end

  # POST /equipment
  # POST /equipment.json
  def create
    @equipment = Equipment.new(equipment_params)
    respond_to do |format|
      if @equipment.save
        format.html { redirect_to @equipment, notice: 'Equipment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @equipment }
        flash[:error] = @equipment.errors.full_messages.join(' ')
      else
        format.html { render action: 'new' }
        format.json { render json: @equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equipment/1
  # PATCH/PUT /equipment/1.json
  def update
    respond_to do |format|
      if @equipment.update(equipment_params)
        format.html { redirect_to @equipment, notice: 'Equipment was successfully updated.' }
        format.json { head :no_content }
        flash[:error] = @equipment.errors.full_messages.join(' ')
      else
        format.html { render action: 'edit' }
        format.json { render json: @equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equipment/1
  # DELETE /equipment/1.json
  def destroy
    @equipment.destroy
    respond_to do |format|
      format.html { redirect_to equipment_index_url }
      format.json { head :no_content }
      flash[:error] = @equipment.errors.full_messages.join(' ')
    end
  end
  
  def import
    Equipment.import(params[:file])
    redirect_to equipment_index_url, notice: "Equipment imported."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipment
      @equipment = Equipment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def equipment_params
      params.require(:equipment).permit(:equip_name, :description, :mode, :wt_limit_lbs, :cb_limit_cuft, :length1_ins, :width1_ins, :height1_ins, :length2_ins, :width2_ins, :height2_ins, :length3_ins, :width3_ins, :height3_ins, :equip_image, {
        shipments_attributes: [:id, :equip_type]}
        )
    end
end
