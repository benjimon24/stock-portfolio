class PortfoliosController < ApplicationController
include UsersHelper

  def index
    require_user
    @portfolios = current_user.portfolios
  end

  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = current_user.portfolios.new(portfolio_params)
    # @portfolio = Portfolio.new(portfolio_params)
    if @portfolio.save
      redirect_to '/'
    else
      @errors = @portfolio.errors.full_messages
      render 'new'
    end
  end

  private
    def portfolio_params
      params.require(:portfolio).permit(:name)
    end
end
