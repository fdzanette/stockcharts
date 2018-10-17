class StocksController < ApplicationController
  def index
    @stocks = Stock.all
  end

  def show
    @stock = Stock.find(params[:id])
    @stock.trade_dates = TradeDate.set_stock_price_history(@stock.name)
    respond_to do |format|
      format.js
    end
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
