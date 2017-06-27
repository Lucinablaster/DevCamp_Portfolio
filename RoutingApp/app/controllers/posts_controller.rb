class PostsController < ApplicationController
  def index
  end

  def missing
  end
  
  def new
  end
  
  def something
    @else = params[:else]
    @another_one = params[:another_one]
  end
  
end