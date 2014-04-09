class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  before_action :set_current_consideration, only: [:index, :show, :edit, :update, :destroy]

  private

    def set_current_consideration
      @consideration = current_consideration
    end

  	def current_adoption
  		Adoption.find(session[:adoption_id])
  	rescue ActiveRecord::RecordNotFound
  		adoption = Adoption.create
  		session[:adoption_id] = adoption.id
  		adoption
  	end

    def current_consideration
      Consideration.find(session[:consideration_id])
    rescue ActiveRecord::RecordNotFound
      consideration = Consideration.create
      session[:consideration_id] = consideration.id
      consideration
    end

    def current_user_session  
      return @current_user_session if defined?(@current_user_session)  
      @current_user_session = UserSession.find  
    end  
      
    def current_user  
      @current_user = current_user_session && current_user_session.record  
    end
end
