class PortfoliosController < ApplicationController
  def index
    @porfolio_items - Portfolio.all
  end
  
  def new
    @porfolio_item = Portfolio.new
  end
  
  def create
    @porfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @porfolio_item.save
        format.html { redirect_to @porfolio_item, notice: 'Your portfolio item is now live.' }
      else
        format.html { render :new }
      end
    end
  end
end

