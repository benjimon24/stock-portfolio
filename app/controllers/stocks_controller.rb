class StocksController < ApplicationController
  include StocksHelper
  include UsersHelper

  before_action :require_user, only: [:show]

  def new
    @stock = Stock.new
    @stock_info = StockQuote::Stock.json_quote(params[:id])
    @portfolios = current_user.portfolios.map {|portfolio| [portfolio.name, portfolio.id]}
    redirect_to stock_path(@stock_info['symbol']) if @portfolios.empty?
  end

  def buy
    portfolio = Portfolio.find(stock_params['portfolio_id'])
    existing_stock = portfolio.stocks.find_by(symbol: stock_params['symbol'])
    if existing_stock
      existing_stock.buy(stock_params['volume'].to_i)
      existing_stock.save
      redirect_to stock_path(stock_params['symbol'])
    else
      @stock = portfolio.stocks.create(stock_params)
      redirect_to stock_path(stock_params['symbol'])
    end
  end

  def sell
    @stock = Stock.find(params[:id])
    @portfolio = @stock.portfolio
    redirect_to root_path unless session[:user_id] == @portfolio.user_id
    @stock_info = StockQuote::Stock.json_quote(@stock.symbol)
  end

  def update
    @stock = Stock.find(params[:id])
    @portfolio = @stock.portfolio
    @stock.sell(stock_params['volume'].to_i)
    redirect_to portfolio_path(@portfolio)
  end


  def search
    redirect_to stock_path(params[:id])
  # this part no longer works because stock search api is broken
  # @response = parse(params[:id])
  end

  def show
    @stock = StockQuote::Stock.quote(params[:id])
    @stock = nil unless @stock.company_name
    @portfolios = portfolios_with(params[:id])
  end

  private

  def stock_params
    params.require(:stock).permit(:volume, :portfolio_id, :symbol, :buy_price)
  end

  def api_key
    "ad66629db14dad47e02a19f582436c500560afcc"
  end
end
