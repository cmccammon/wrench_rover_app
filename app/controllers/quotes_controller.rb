class QuotesController < ApplicationController
  
  before_action :authenticate_service_center!
  before_action :set_quote, only: [:show, :edit, :update, :destroy]

  def create
      @request = Request.find(params[:request_id])
      @quote = @request.quotes.create(quote_params)

      if @quote.save
        redirect_to :sc_dashboard_requests
      else
        redirect_back(fallback_location: request)
      end
  end

  private

    def set_quote
      @quote = Quote.find(params[:id])
    end


    def quote_params
      params.require(:quote).permit(:cost, :comment, :request_id)
    end
end
