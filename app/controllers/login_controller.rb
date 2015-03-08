class LoginController < ApplicationController
	def index

	end

	def login
<<<<<<< HEAD
<<<<<<< HEAD
		
=======
=======
>>>>>>> Added code to login controller
        client = Databasedotcom::Client.new("config/databasedotcom.yml")
        client.authenticate :username => 'sampaul@berkeley.edu', :password => 'pleasedontkillme1TfPa8Eb0NneMsYA56IWaYDvd'
        client.materialize("Contact")
        contact = SFDC::Contact.find_by_email(email_address_field)
        password = contact.Password__c

        if password == password_field:
        	# GRANT ACCESS
        else:
        	# DENY ACCESS
<<<<<<< HEAD
>>>>>>> Added code to login controller
=======
>>>>>>> Added code to login controller
	end
end


# Added Password field to Contact.
<<<<<<< HEAD
# 
=======
# 
>>>>>>> Added code to login controller
