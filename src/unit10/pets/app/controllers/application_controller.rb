class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

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
end
