class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  private
  	def current_user_session  
      return @current_user_session if defined?(@current_user_session)  
      @current_user_session = UserSession.find  
    end  
      
    def current_user  
      @current_user = current_user_session && current_user_session.record  
    end

    def check_rights
      if !current_user
        respond_to do |format|
          format.html { redirect_to '/login', notice: 'You must be logged in to perform this action.' }
          format.json 
        end
      end
    end
end
