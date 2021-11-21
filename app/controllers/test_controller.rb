class TestController < ApplicationController
  def search
    render :index
  end

  def index
    @users = User.search(params[:search])
  end

  private
    def test_params
      params.permit(:search)
    end
end
