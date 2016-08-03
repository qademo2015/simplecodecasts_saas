module UsersHelper
    
    def job_title_icon
        
        # Job titles should exactly match those in 'views/profiles/_form.html.erb'
        if @user.profile.job_title == "Developer"
            "<i class='fa fa-code'></i>".html_safe
        elsif @user.profile.job_title == "Entrepreneur"    
            "<i class='fa fa-lightbulb-o'></i>".html_safe
        elsif @user.profile.job_title == "Investor"
             "<i class='fa fa-dollar'></i>".html_safe
        end    
    end    
    
end