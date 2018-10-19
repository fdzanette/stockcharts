class StocksController < ApplicationController
  before_action :set_stock, only: [:show, :set_moving_average, :set_num_of_rows]

  def index
    @stocks = Stock.all
  end

  def show
    @moving_average1 = set_moving_average(set_num_of_rows,5)
    @moving_average2 = set_moving_average(set_num_of_rows,13)
    @moving_average3 = set_moving_average(set_num_of_rows,21)
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

  def set_moving_average(x,y)
    y = x - 1 if y > x
    average_array = []
    @stock.trade_dates.each do |trade|
      average_array << trade.close
    end
    average_array.ema(x,y)
  end

  def set_num_of_rows
    rows = 0
    @stock.trade_dates.each do |trade|
      rows += 1
    end
    rows - 1
  end

end
