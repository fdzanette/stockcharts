class StocksController < ApplicationController
  def index
    @names = ["Petr4", "Vale5", "Bbas3"]
    @stocks = Stock.all
    #@stock = Stock.new(name: TradeDate.set_stock_name)
  end

  def show
    @stock = Stock.find(params[:id])
    @stock.trade_dates = TradeDate.set_stock_price_history(@stock.name)
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

end
