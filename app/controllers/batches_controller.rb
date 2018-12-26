class BatchesController < ApplicationController
    before_action :set_batch, only: [:show, :edit, :update, :destroy]


    def index
      @batches = Strain.batches.all
      render json: @batches
      end

      def api_batches
        @strains = Strain.all
        @batches = Batch.all
      render json: @batches
      render json: @strains
    end



    def show
      @strain = Strain.find_by(params[:strain_id])
      @batch = @strain.batches.find_by(params[:batch_id])
      render json: {batches: @batch}
      render json: {strain: @strain}
    end


    def new
      @strain = Strain.new
      render 'new'
    end


    def edit

    end


    def create
    @strain = Strain.new(strain_params)
  respond_to do |format|
      if @strain.save
        format.html { redirect_to @strain, notice: 'Link was successfully created.' }
        format.json { render :show, status: :created, location: @strain }
      else
        format.html { render :new }
        format.json { render json: @strain.errors, status: :unprocessable_entity }
      end
    end
  end


    def update
      respond_to do |format|
        if @strain.update(post_params)
          format.html { redirect_to @strain, notice: 'Post was successfully updated.' }
          format.json { render :show, status: :ok, location: @strain }
        else
          format.html { render :edit }
          format.json { render json: @strain.errors, status: :unprocessable_entity }
        end
      end
    end


    def destroy
      @strain.destroy
      respond_to do |format|
        format.html { redirect_to posts_url, notice: 'Strain was successfully destroyed.' }
        format.json { head :no_content }
      end
    end


  private

    def set_batch
      @batch = Batch.find(params[:id])
    end


    def batch_params
      params.require(:batch).permit(:batch_name,:batch_mea, :batch_int, :batch_notes:[])
    end
end
