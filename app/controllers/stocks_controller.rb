class StocksController < ApplicationController
  before_action :set_stock, only: [:show, :get_strategy_numbers]

  def index
    @stocks = Stock.all
  end

  def show
  end

  def get_strategy_numbers
    @strategy = Strategy.new

  end

  def new
    @stock = Stock.new
  end

  def create
    @stock = Stock.new(stock_params)
    @stock.save
  end

  private

  def stock_params
    params.require(:stock).permit(:name)
  end

  def set_stock
    @stock = Stock.find(params[:id])
    @stock.trade_dates = TradeDate.set_stock_price_history(@stock.name)
  end

end
