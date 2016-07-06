class UsersController < ApplicationController
    #next row will force user authentication before performing any type of activity
    before_action :authenticate_user!
    
    def show
        @user = User.find( params[:id] )
    end
end    