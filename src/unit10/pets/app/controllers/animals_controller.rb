class AnimalsController < ApplicationController
  def index
  	@pets = Pet.where(status: 'Avaliable').order(:name)
  	@consideration = current_consideration
  end
end
