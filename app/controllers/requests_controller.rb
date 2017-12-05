class RequestsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new]
  before_action :authenticate_service_center!, only: [:sc_dashboard, :add_quote]
  before_action :set_request, only: [:show, :edit, :update, :destroy]

    def sc_dashboard
      @requests = Request.where.not( id: Request.joins(:quotes).where(quotes: { service_center_id: current_service_center.id }).select(:id) )
      @service_center = current_service_center
      @service_center_quotes = Quote.where(service_center_id: current_service_center.id).includes(:appointment).where(appointments: {quote_id: nil})
      @service_center_uncompleted = current_service_center.appointments.where(completed: "false")
      @service_center_completed = current_service_center.appointments.where(completed: "true")
    end

    def complete
      @request = Appointment.find(params[:id])
      @request.completed = true
      @request.save
      redirect_to sc_dashboard_requests_path
    end
    # GET /requests
    # requests/index.html.erb
    # displays all requests
    def index
      @requests = current_user.requests.all
      @quotes_no_appointment = current_user.quotes.left_outer_joins(:appointment).where(appointments: {id: nil})
      @requests_no_appointment = current_user.requests.includes(:appointments).where(appointments: {completed: "false"})
      @appointments = current_user.appointments
    end

    # GET /requests/1
    # requests/show.html.erb
    # this will show the request
    # will also contain the comment form to create a new comment and show comments
    def show
      @request = Request.find(params[:id])
      @appointment = Appointment.new
    end

    def add_quote
      @request = Request.find(params[:id])
      @service_center = current_service_center
    end

    # GET /requests/new
    # requests/new.html.erb
    # form to create a new request
    def new
      @request = Request.new
    end

    # GET /requests/1/edit
    # edit.html.erb
    # form for editing request
    def edit
      @request = Request.find(params[:id])
    end

    # POST /requests
    # requests/index.html.erb
    # after new request created in form on new.html.erb above,
    # redirects to index page where new request will appear
    def create
      @request = Request.new(request_params)
      @request.user = current_user
      @request.auto = current_user.autos.last
      if @request.save
        redirect_to requests_path, notice: 'Request was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /requests/1
    # requests/show.html.erb
    # updates specific request
    def update
      respond_to do |format|
        if @request.update(request_params)
          format.html { redirect_to @request, notice: 'Request was successfully updated.' }
          format.json { render :show, status: :ok, location: @request }
        else
          format.html { render :edit }
          format.json { render json: @request.errors, status: :unprocessable_entity }
        end
      end
    end
    # DELETE /requests/1
      # requests/show.html.erb
      # deletes specific request
    def destroy
      @request.destroy
      respond_to do |format|
        format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
        format.json { head :no_content }
      end
    end



private
  # Use callbacks to share common setup or constraints between actions.
  def set_request
    @request = Request.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def request_params
    params.require(:request).permit( :description, :completed, :user_id, :auto_id, service:[])
  end

end
