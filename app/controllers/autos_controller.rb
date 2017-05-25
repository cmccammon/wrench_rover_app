class AutosController < ApplicationController
  before_action :set_auto, only: [:show, :edit, :update, :destroy]
  include Edmunds_get

  # GET /autos
  # GET /autos.json
  def index
    @autos = Auto.all
  end

  # GET /autos/1
  # GET /autos/1.json
  def show
  end

  # GET /autos/new
  def new
    @auto = Auto.new
    @makes = Edmunds::Make.new.find_new_and_used_makes_by_model_year(1999)
    @models = Edmunds::Model.new.find_models_by_make_and_year("honda", 1999)
    @get_makes = get_makes
    @get_years = get_years
    @get_models = get_models
  end

  # GET /autos/1/edit
  def edit
  end

  # POST /autos
  # POST /autos.json
  def create
    @auto = Auto.new(auto_params)

    respond_to do |format|
      if @auto.save
        format.html { redirect_to @auto, notice: 'Auto was successfully created.' }
        format.json { render :show, status: :created, location: @auto }
      else
        format.html { render :new }
        format.json { render json: @auto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /autos/1
  # PATCH/PUT /autos/1.json
  def update
    respond_to do |format|
      if @auto.update(auto_params)
        format.html { redirect_to @auto, notice: 'Auto was successfully updated.' }
        format.json { render :show, status: :ok, location: @auto }
      else
        format.html { render :edit }
        format.json { render json: @auto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /autos/1
  # DELETE /autos/1.json
  def destroy
    @auto.destroy
    respond_to do |format|
      format.html { redirect_to autos_url, notice: 'Auto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auto
      @auto = Auto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auto_params
      params.require(:auto).permit(:make, :model, :year, :trim, :image)
    end
end
