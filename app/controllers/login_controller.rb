class LoginController < ApplicationController
	def index

	end

	def login
        client = Databasedotcom::Client.new("config/databasedotcom.yml")
        client.authenticate :username => 'sampaul@berkeley.edu', :password => 'pleasedontkillme1TfPa8Eb0NneMsYA56IWaYDvd'
        client.materialize("Contact")
        contact = SFDC::Contact.find_by_email(email_address_field)
        password = contact.Password__c

        if password == password_field:
        	# GRANT ACCESS
        else:
        	# DENY ACCESS
	end
end


# Added Password field to Contact.
<<<<<<< HEAD
=======
# 
>>>>>>> 400a2f6e394d242308259cca6ac2f3b314c4e9f6
