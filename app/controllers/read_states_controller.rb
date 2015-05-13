class ReadStatesController < ApplicationController
  def create
    @read_state = ReadState.create state_params
    if @read_state.save
      redirect_to book_path params[:book_id]
    else 
      redirect_to book_path
    end
  end

  private

  def state_params
    params.permit :user_id, :book_id, :state    
  end
end
