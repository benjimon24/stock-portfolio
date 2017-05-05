class StocksController < ApplicationController
  include StocksHelper
  include UsersHelper

  def new
    @stock = Stock.new
    @stock_info = StockQuote::Stock.json_quote(params[:id])["quote"]
    @list_of_portfolios = current_user.portfolios.map {|portfolio| portfolio.name}
  end

  def buy
  end

  def search
    @response = parse(params[:id])
  end

  def show
    @stock = StockQuote::Stock.json_quote(params[:id])["quote"]
    @stock = nil unless @stock['Name']
    @portfolios = portfolios_with(params[:id])
  end

  private
    def api_key
      "ad66629db14dad47e02a19f582436c500560afcc"
    end
end
