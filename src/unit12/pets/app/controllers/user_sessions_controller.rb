class UserSessionsController < ApplicationController
  before_action :set_user_session, only: [:destroy]

  def new  
    @user_session = UserSession.new  
  end

  def create  
    @user_session = UserSession.new(user_session_params)

    respond_to do |format|
      if @user_session.save
        format.html { redirect_to animals_url, notice: 'Successfully logged in.' }
        format.json { render action: 'show', status: :created, location: @user_session }
      else
        format.html { render action: 'new' }
        format.json { render json: @user_session.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @user_session
      @user_session.destroy
      respond_to do |format|
        format.html { redirect_to animals_url, notice: 'Successfully logged out.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to animals_url }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_session
      @user_session = UserSession.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_session_params
      params.require(:user_session).permit(:username, :password)
    end
end
