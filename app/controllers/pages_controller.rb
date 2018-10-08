class PagesController < ApplicationController
  def index
    @page = Page.new
  end
end
