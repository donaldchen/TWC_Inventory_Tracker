class LoginController < ApplicationController
    include Databasedotcom::Rails::Controller

    def index
        if session[:login]
            flash[:notice] = "Login Successful"
        else
            redirect_to login_path
        end
    end

    def login

    end
    
    def verify
        c = Contact.find_by_email(params[:email])
        if c != nil and c.Password__c == params[:password]
        	session[:login] = true
        else
        	flash[:notice] = "Login not Successful"
        end
        
        redirect_to root_path
    end
        
        
    def logout
        session[:login] = false
        redirect_to root_path
    end

# Added Password field to Contact.
# Connected App:        All users may self authorize, relax ip restrictions
end