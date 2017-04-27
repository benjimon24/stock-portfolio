module PortfoliosHelper

  def total_value
    current_user.portfolios.inject()
  end
  
end
