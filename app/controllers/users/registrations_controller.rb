 #frozen_string_literal: true

 class Users::RegistrationsController < Devise::RegistrationsController
    before_action :set_user
    
    def show
        @user = User.where(id: params[:id]).first
    end



    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.where(id: params[:id]).first
    end
end
  