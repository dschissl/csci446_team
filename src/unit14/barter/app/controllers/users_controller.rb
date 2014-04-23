class UsersController < ApplicationController
  before_action :check_login, only: [:new]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to root_url, notice: 'Registration successful.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit  
    @user = current_user  
  end  
    
  def update  
    @user = current_user  
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to root_url, notice: 'Successfully updated profile.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end 

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation).merge(is_admin: false)
    end

    def check_login
      if current_user_session
        respond_to do |format|
          format.html { redirect_to root_url, notice: 'You already have an account.' }
        end
      end
    end
end