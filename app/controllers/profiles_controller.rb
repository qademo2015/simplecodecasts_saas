class ProfilesController < ApplicationController
    #next row will force user authentication before performing any type of activity
    before_action :authenticate_user!
    
    #next row will prevent user from being able to edit/change somebody else's data
    before_action :only_current_user
    
    def new
        # form where a user can fill out their own profile.
        @user = User.find( params[:user_id] )
        @profile = @user.build_profile
    end
    
    def create
        @user = User.find( params[:user_id] )
        @profile = @user.build_profile(profile_params)
        if @profile.save
            flash[:success] = 'Profile Updated!'
            redirect_to user_path( params[:user_id] )
        else    
            render action: :new
        end    
    end
    
    def edit
        @user = User.find( params[:user_id] )
        @profile = @user.profile
    end
    
    def update
        @user = User.find( params[:user_id] )
        @profile = @user.profile
        #next block will redirect user to his main page in case of successfull update
        #user's profile
        if @profile.update_attributes(profile_params)
            flash[:success] = 'Profile updated!'        
            redirect_to user_path( params[:user_id] )
        else
            #next row will redirect user to the Edit page in case if failure
            render action: :edit
        end    
    end    
    
    private
        def profile_params
            params.require(:profile).permit(:first_name, :last_name, :avatar, :job_title, :phone_number, :contact_email, :description)
        end
        
        def only_current_user
            @user = User.find( params[:user_id] )
            redirect_to(root_url) unless @user == current_user
        end    
    
end    