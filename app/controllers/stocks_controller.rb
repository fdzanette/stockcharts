class StocksController < ApplicationController
  before_action :set_stock, only: [:show, :set_ema]

  def index
    @stocks = Stock.all
  end

  def show
    @moving_average1 = set_ema1
    @moving_average2 = set_ema2
    @moving_average3 = set_ema3

  end

  def set_ema1
    average_array = []
    @stock.trade_dates.each do |trade|
      average_array << trade.close
    end
    average_array.ema(3,3)
  end

  def set_ema2
    average_array = []
    @stock.trade_dates.each do |trade|
      average_array << trade.close
    end
    average_array.ema(6,6)
  end

  def set_ema3
    average_array = []
    @stock.trade_dates.each do |trade|
      average_array << trade.close
    end
    average_array.ema(10,10)
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
