class PortfoliosController < ApplicationController
  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = Portfolio.new(user_params)
    if @portfolio.save
      redirect_to '/'
    else
      @errors = @portfolio.errors.full_messages
      render 'new'
    end
  end
end
