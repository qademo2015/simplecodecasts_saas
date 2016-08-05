class UsersController < ApplicationController
    #next row will force user authentication before performing any type of activity
    before_action :authenticate_user!
    
    # method below will be used to show all community members.
    # The corresponding view should be titled 'index.html.erb'
    # and be located in 'app/views/users' folder
    def index
        @users = User.all
    end    
    
    def show
        @user = User.find( params[:id] )
    end
end    