class PortfoliosController < ApplicationController
  layout 'portfolio'
  def index
    @porfolio_items - Portfolio.all
  end
  
  def angular
    @angular_portfolio_items = Portfolio.angular
  end
  
  def new
    @porfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
  end
  
  def create
    @porfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @porfolio_item.save
        format.html { redirect_to @porfolio_item, notice: 'Your portfolio item is now live.' }
      else
        format.html { render :new }
      end
    end
  end
  
  def edit
    @porfolio_item = Portfolio.find(params[:id])
    
  end
  
  def update
    @porfolio_item = Portfolio.find(params[:id])
    
    respond_to do |format|
      if @porfolio_item.update(porfolio_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show
    @porfolio_item = Portfolio.find(params[:id])
  end
  
  def destroy
    # Perform the lookup
    @porfolio_item = Portfolio.find(params[:id])
    
    # Destroy/delete the record
    @porfolio_item.destroy
    
    # Redirect
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Record was removed.' }
    end
  end
  
  private
  def porfolio_params
    params.require(:portfolio).permit(:title, 
                                      :subtitle, 
                                      :body, 
                                      technologies_attributes: [:name]
                                      )
  end
  
end
