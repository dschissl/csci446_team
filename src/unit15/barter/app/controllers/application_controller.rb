class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  private
  	def current_user_session  
      return @current_user_session if defined?(@current_user_session)  
      @current_user_session = UserSession.current_user_session 
    end
    
    def current_user  
      UserSession.current_user
    end

    def check_rights
      if !current_user
        respond_to do |format|
          format.html { redirect_to '/login', notice: 'You must be logged in to perform desired action.' }
          format.json 
        end
      end
    end
end
