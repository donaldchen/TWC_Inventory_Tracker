class LoginController < ApplicationController
    include Databasedotcom::Rails::Controller
    
    def index
    end

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

# Added Password field to Contact.
# Connected App:        All users may self authorize, relax ip restrictions
end