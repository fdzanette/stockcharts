class PagesController < ApplicationController
  def index
    @page = Page.set_chart_data
    p @page
  end
end
