require 'spec_helper'
require 'rails_helper'

RSpec.describe LoginController, type: :controller do
	describe "GET #index" do
		it "succesfully redirects without being logged in" do
			get :index, {}, {}
			response.should redirect_to login_path
		end

		it "successfully loads the index if logged in" do
			get :index, {}, {login: true}
			response.should render_template :index
		end
	end

	describe "POST #verify" do
		# it "succesfully rejects email not in database" do
		# 	post :verify, {email: "EAKHFELAKHGKLEAGKLEHGLKEAHG", password: nil}, {}
		# 	expect(flash[:notice]).to eq "Login not Successful"
		# end

		# it "successfully signs in with valid email, non-valid password" do
		# 	post :verify, {email: "test1@test1.com", password: "False"}, {}
		# 	expect(flash[:notice]).to eq "Login not Successful"
		# end

		# it "successfully signs in with valid email, valid password" do
		# 	post :verify, {email: "test1@test1.com", password: "test1"}, {}
		# 	expect(flash[:notice]).to eq "Login Successful"
		# end

		# it "successfully redirects after verify" do
		# 	post :verify, {email: "test1@test1.com", password: "test1"}, {}
		# 	response.should redirect_to root_path
		# end
	end

	describe "GET #logout" do
		it "successfully redirects after logout" do
			get :logout, {}, {login: true}
			response.should redirect_to root_path
		end

		it "successfully redirects after logout" do
			get :logout, {}, {login: true}
			expect(session[:login]).to be false
		end

		it "successfully flashes after logout" do
			get :logout, {}, {login: true}
			expect(flash[:notice]).to eq "Logout Successful"
		end
	end

end
