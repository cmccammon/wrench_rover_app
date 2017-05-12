class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]

    # GET /requests
    # requests/index.html.erb
    # displays all requests
    def index
      @requests = Request.all
    end

    # GET /requests/1
    # requests/show.html.erb
    # this will show the request
    # will also contain the comment form to create a new comment and show comments
    def show
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
    end

    # POST /requests
    # requests/index.html.erb
    # after new request created in form on new.html.erb above,
    # redirects to index page where new request will appear
    def create
      @request = Request.new(request_params)

      if @request.save
        redirect_to requests_url, notice: 'Request was successfully created.'
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
    params.require(:request).permit(:service, :description)
  end

end
