class StocksController < ApplicationController
  def index
    @stocks = Stock.all
    @stock = Stock.new(name: TradeDate.set_stock_name)
    @stock.trade_dates = TradeDate.set_stock_price_history
  end

  def show
    #@stock = Stock.find(params:id)
  end

  def new
  end

  def create

  end


end
