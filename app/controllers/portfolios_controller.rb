class PortfoliosController < ApplicationController
include UsersHelper
  before_action :find_portfolio, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:index, :new]
  before_action :authorize_user, only: [:show, :edit]

  def index
    @portfolios = current_user.portfolios
  end

  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = current_user.portfolios.new(portfolio_params)
    if @portfolio.save
      redirect_to '/'
    else
      @errors = @portfolio.errors.full_messages
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @portfolio.update(portfolio_params)
      redirect_to portfolios_path
    else
      @errors = @portfolio.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @portfolio.destroy
    redirect_to portfolios_path
  end

  private
    def portfolio_params
      params.require(:portfolio).permit(:name)
    end

    def find_portfolio
      @portfolio = Portfolio.find(params[:id])
    end
end
