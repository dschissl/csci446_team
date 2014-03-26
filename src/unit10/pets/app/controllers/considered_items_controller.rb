class ConsideredItemsController < ApplicationController
  before_action :set_considered_item, only: [:show, :edit, :update, :destroy]

  # GET /considered_items
  # GET /considered_items.json
  def index
    @considered_items = ConsideredItem.all
  end

  # GET /considered_items/1
  # GET /considered_items/1.json
  def show
  end

  # GET /considered_items/new
  def new
    @considered_item = ConsideredItem.new
  end

  # GET /considered_items/1/edit
  def edit
  end

  # POST /considered_items
  # POST /considered_items.json
  def create
    @consideration = current_consideration
    pet = Pet.find(params[:pet_id])
    @consideration.considered_items.each do |item|
      if item.pet_id == pet.id
        return
      end
    end
    @considered_item = @consideration.considered_items.build(pet: pet)

    respond_to do |format|
      if @considered_item.save
        format.html { redirect_to animals_url }
        format.js { @current_considered_item = @considered_item }
        format.json { render action: 'show', status: :created, location: @considered_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @considered_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /considered_items/1
  # PATCH/PUT /considered_items/1.json
  def update
    respond_to do |format|
      if @considered_item.update(considered_item_params)
        format.html { redirect_to @considered_item, notice: 'Considered item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @considered_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /considered_items/1
  # DELETE /considered_items/1.json
  def destroy
    @considered_item.destroy
    respond_to do |format|
      format.html { redirect_to considered_items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_considered_item
      @considered_item = ConsideredItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def considered_item_params
      params.require(:considered_item).permit(:pet_id, :consideration_id)
    end
end
