class AdoptionsController < ApplicationController
  before_action :set_adoption, only: [:show, :edit, :update, :destroy]
  before_action :check_rights, only: [:show, :index, :new, :create, :edit, :update, :destroy]

  # GET /adoptions
  # GET /adoptions.json
  def index
    @adoptions = Adoption.all
  end

  # GET /adoptions/1
  # GET /adoptions/1.json
  def show
    begin
      @adoption = Adoption.find(params[:id]) 
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid adoption #{params[:id]}"
      redirect_to animals_url, notice: 'Invalid adoption' 
    else
      respond_to do |format|
        format.html # show.html.erb 
        format.json { render json: @adoption }
      end 
    end
  end

  # GET /adoptions/new
  def new
    if current_user
      @adoption = Adoption.new
    else
      respond_to do |format|
        format.html { redirect_to new_user_session_url, notice: 'You must be logged in to adopt a pet.' }
        format.json 
      end
    end
  end

  # GET /adoptions/1/edit
  def edit
  end

  # POST /adoptions
  # POST /adoptions.json
  def create
    @adoption = Adoption.new(adoption_params)

    respond_to do |format|
      if @adoption.save
        format.html { redirect_to @adoption, notice: 'Adoption was successfully created.' }
        format.json { render action: 'show', status: :created, location: @adoption }
      else
        format.html { render action: 'new' }
        format.json { render json: @adoption.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adoptions/1
  # PATCH/PUT /adoptions/1.json
  def update
    respond_to do |format|
      if @adoption.update(adoption_params)
        format.html { redirect_to @adoption, notice: 'Adoption was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @adoption.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adoptions/1
  # DELETE /adoptions/1.json
  def destroy
    @adoption.destroy
    respond_to do |format|
      format.html { redirect_to animals_url, notice: 'Adoption has been canceled.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adoption
      begin
        @adoption = Adoption.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        logger.error "Attempt to access invalid adoption #{params[:id]}"
        redirect_to animals_url, notice: 'Invalid adoption' 
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def adoption_params
      params[:adoption]
    end

    def check_rights
      if !current_user
        respond_to do |format|
          format.html { redirect_to new_user_session_url, notice: 'You must be logged in to adopt a pet.' }
          format.json 
        end
      end
    end
end
