class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy, :accept, :decline]
  before_action :check_rights, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  before_action :check_and_set_item, only: [:new]

  # GET /offers
  # GET /offers.json
  def index
    @offers = Offer.all
  end

  # GET /offers/1
  # GET /offers/1.json
  def show
    @item = Item.find(@offer.item_id)
  end

  # GET /offers/new
  def new
    @offer = Offer.new
  end

  # GET /offers/1/edit
  def edit
  end

  def accept
    @offer.status = "Accepted"
    @offer.item.status = "Taken"

    respond_to do |format|
      if @offer.save and @offer.item.save
        format.html { redirect_to offers_url, notice: 'Offer was successfully accepted.' }
        format.json { render action: 'show', status: :created, location: @offer }
      else
        format.html { redirect_to offers_url, notice: 'An error occured.' }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  def decline
    @offer.status = "Declined"

    respond_to do |format|
      if @offer.save
        format.html { redirect_to offers_url, notice: 'Offer was successfully declined.' }
        format.json { render action: 'show', status: :created, location: @offer }
      else
        format.html { redirect_to offers_url, notice: 'An error occured.' }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /offers
  # POST /offers.json
  def create
    @offer = Offer.new(offer_params)
    @item = Item.find(@offer.item_id)
    params[:offer][:line_item_ids].each do |item|
      line_item = LineItem.new(:item_id => item, :offer_id => @offer.id)
      if line_item.valid?
       line_item.save
      else
       @errors += line_item.errors
      end
    end

    respond_to do |format|
      if @offer.save
        format.html { redirect_to offers_url, notice: 'Offer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @offer }
      else
        format.html { render action: 'new' }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offers/1
  # PATCH/PUT /offers/1.json
  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to @offer, notice: 'Offer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    @offer.destroy
    respond_to do |format|
      format.html { redirect_to offers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    def set_item
      @item = Item.find(params[:item_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offer_params
      params.require(:offer).permit(:message, :item_id).merge(user_id: current_user.id).merge(status: "Pending")
    end

    def check_and_set_item
      begin
        set_item
      rescue
        respond_to do |format|
          format.html { redirect_to '/', notice: 'Invalid item.' }
          format.json 
        end
      end
    end
end
