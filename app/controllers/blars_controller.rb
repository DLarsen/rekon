class BlarsController < ApplicationController
  before_action :set_blar, only: [:show, :edit, :update, :destroy]

  # GET /blars
  # GET /blars.json
  def index
    @blars = Blar.all
  end

  # GET /blars/1
  # GET /blars/1.json
  def show
  end

  # GET /blars/new
  def new
    @blar = Blar.new
  end

  # GET /blars/1/edit
  def edit
  end

  # POST /blars
  # POST /blars.json
  def create
    @blar = Blar.new(blar_params)

    respond_to do |format|
      if @blar.save
        format.html { redirect_to @blar, notice: 'Blar was successfully created.' }
        format.json { render action: 'show', status: :created, location: @blar }
      else
        format.html { render action: 'new' }
        format.json { render json: @blar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blars/1
  # PATCH/PUT /blars/1.json
  def update
    respond_to do |format|
      if @blar.update(blar_params)
        format.html { redirect_to @blar, notice: 'Blar was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @blar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blars/1
  # DELETE /blars/1.json
  def destroy
    @blar.destroy
    respond_to do |format|
      format.html { redirect_to blars_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blar
      @blar = Blar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blar_params
      params.require(:blar).permit(:title)
    end
end
