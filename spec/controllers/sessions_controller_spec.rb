require 'spec_helper'

describe SessionsController do
	before :each do
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
  end

  it { request.env["omniauth.auth"]['uid'].should == '100008268030218' }

  context 'session #destroy' do
  	it 'makes session nil' do
  		session[:user_id] = user1.id
  		get :destroy
  		session[:user_id].should be_nil
  	end

  	it 'redirects to index' do
  		get :destroy
  		response.should redirect_to root_path
  	end
  end
end