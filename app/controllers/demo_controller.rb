class DemoController < ApplicationController
  layout 'application'
  def index
    #render('hello')
  end
  def hello
    #render('index')
    @array=[1,2,3,4]
    @id = params[:id].to_i
    @page = params[:page].to_i
  end
  def other_hello
    redirect_to(:controller => 'demo', :action => 'hello')
  end
  def lynda
    redirect_to('http://lynda.com')
  end
  def escape_output

  end
end
