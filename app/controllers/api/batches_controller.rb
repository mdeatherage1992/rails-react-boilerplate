class Api::BatchesController < ApplicationController
  def index
    @strain = Strain.find_by(params[:id])
    @batches = @strain.batches.all
    render json: @batches
  end
end
