class LoginController < ApplicationController
    include Databasedotcom::Rails::Controller

    def index
        if session[:login]
            render "index.html.haml"
        else
            render "login.html.haml"
        end
    end

    def login
        c = Contact.find_by_email(params[:email])
        if c != nil and c.Password__c == params[:password]
        	session[:login] = true
        else
        	flash[:notice] = "Login not Successful"
        end
        
        redirect_to root_path
    end

<<<<<<< HEAD
=======
=begin
    def login
        client = Databasedotcom::Client.new("config/databasedotcom.yml")
        client.authenticate :username => 'sampaul@berkeley.edu', :password => 'pleasedontkillme1TfPa8Eb0NneMsYA56IWaYDvd'
        client.materialize("Contact")
        contact = Contact.find_by_email(params[:email])
        password = contact.Password__c
        if password == params[:password_field]
        	flash[:notice] = "Login Successful"
        else
        	flash[:notice] = "Login not Successful"
        end
        
        redirect_to root
	end
=end

>>>>>>> eb502c3f0c76c5cb029b11a797b3f0d2baaa0b57
# Added Password field to Contact.
# Connected App:        All users may self authorize, relax ip restrictions
end