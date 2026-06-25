class DemoController < ApplicationController

  def index 
  end

  def hello
  #  render('index')
  @array = [1,2,3,4,5]
  @id = params[:id]
  @page = params['page']
  end

  def other_hello
    redirect_to(:controller => 'demo',:action => 'index')
  end

  def text_helper
  end

  def escape_output
  end
  
end
