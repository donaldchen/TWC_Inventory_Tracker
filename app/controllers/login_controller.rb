class LoginController < ApplicationController
    include Databasedotcom::Rails::Controller
    skip_before_filter :check_login

    def index
        if not session[:login]
            redirect_to login_path
        end
    end

    def login

    end
    
    def verify
        c = Contact.find_by_email(params[:email]); nil
        if c != nil and c.Password__c == params[:password]
        	session[:login] = true
        	flash[:notice] = "Login Successful"
        else
        	flash[:notice] = "Login not Successful"
        end
        
        redirect_to root_path
    end
        
        
    def logout
        session[:login] = false
        flash[:notice] = "Logout Successful"
        redirect_to root_path
    end

# Added Password field to Contact.
# Connected App:        All users may self authorize, relax ip restrictions
end