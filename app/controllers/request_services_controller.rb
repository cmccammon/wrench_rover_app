class RequestServicesController < ApplicationController
  before_action :set_request_service, only: [:show, :edit, :update, :destroy]

  # GET /request_services
  # GET /request_services.json
  def index
    @request_services = RequestService.all
  end

  # GET /request_services/1
  # GET /request_services/1.json
  def show
  end

  # GET /request_services/new
  def new
    @request_service = RequestService.new
    @service = Service.all
  end

  # GET /request_services/1/edit
  def edit
  end

  # POST /request_services
  # POST /request_services.json
  def create
    @request_service = RequestService.new(request_service_params)

    respond_to do |format|
      if @request_service.save
        format.html { redirect_to requests_path, notice: 'Request service was successfully created.' }
        format.json { render :show, status: :created, location: @request_service }
      else
        format.html { render :new }
        format.json { render json: @request_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /request_services/1
  # PATCH/PUT /request_services/1.json
  def update
    respond_to do |format|
      if @request_service.update(request_service_params)
        format.html { redirect_to @request_service, notice: 'Request service was successfully updated.' }
        format.json { render :show, status: :ok, location: @request_service }
      else
        format.html { render :edit }
        format.json { render json: @request_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /request_services/1
  # DELETE /request_services/1.json
  def destroy
    @request_service.destroy
    respond_to do |format|
      format.html { redirect_to request_services_url, notice: 'Request service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request_service
      @request_service = RequestService.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_service_params
      params.require(:request_service).permit(:service_id, :request_id)
    end
end
