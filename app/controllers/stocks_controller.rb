class StocksController < ApplicationController

  def show
    @stock = StockQuote::Stock.json_quote(params[:id])["quote"]
  end

end
