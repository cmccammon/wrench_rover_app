class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  def create
      @request = Request.find(params[:request_id])
      @quote = @request.quotes.create(quote_params)

      if @quote.save
        redirect_to requests_path(@request)
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
