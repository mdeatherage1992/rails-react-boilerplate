class Api::StrainsController < ApplicationController

  def index
    @strains = Strain.all
    @batches = Batch.all
    render json: @strains
  end

  def show
    @strain = Strain.find_by(params[:id])
    @batches = @strains.batches.all
    render json: @strain 
  end
end
