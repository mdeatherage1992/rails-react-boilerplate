class StrainsController < ApplicationController
    before_action :set_strain, only: [:show, :edit, :update, :destroy]


    def index
      @strains = Strain.all
      @batches = Batch.all
    render json: @strains && @batches
      end

    def api_strains
      @strains = Strain.all
      @batches = Batch.all
    render json: @strains && @batches
  end


    def show
      @strain = Strain.find_by(params[:id])
      @batches = @strain.batches.all
      render json: {strain: @strain}
      render json: {batches: @batches}
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

      def set_strain
        @strain = Strain.find(params[:id])
      end


      def strain_params
        params.require(:strain).permit(:strain_id,:strain_name, :strain_feeling,:strain_rating,strain_notes:[], strain_batches:[:id])
      end
  end
