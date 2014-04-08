class AnimalsController < ApplicationController
  def index
  	@pets = Pet.where(status: 'Avaliable').order(:name)
  end
end
