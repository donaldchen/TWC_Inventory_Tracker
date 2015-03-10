class LoginController < ApplicationController
    include Databasedotcom::Rails::Controller

    def index
    end

    def login
        c = Contact.find_by_email(params[:email])
        if c != nil
        	flash[:notice] = c.Password__c
        else
        	flash[:notice] = "Login not Successful"
        end
        
        redirect_to root_path
    end

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

# Added Password field to Contact.
# Connected App:        All users may self authorize, relax ip restrictions
end