class RequestsController < ApplicationController  
  def new
    @request = Request.new
  end

  def create
    @request = current_user.requests.new request_params  
    if @request.save
      redirect_to current_user
    else
      render 'new'
    end
  end

  private
  def request_params 
    params.require(:request).permit :book_name, :attr_state, :book_link
  end  
end
