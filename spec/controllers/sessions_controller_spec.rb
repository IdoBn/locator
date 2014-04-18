require 'spec_helper'

describe SessionsController do
	before :each do
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
  end

  it { request.env["omniauth.auth"]['uid'].should == '100008268030218' }

  context 'session #destroy' do
  	it { { get: :destroy }.should_not be_routable }

  	it 'makes session nil' do
  		session[:user_id] = user1.id
  		delete :destroy
  		session[:user_id].should be_nil
  	end

  	it 'redirects to index' do
  		delete :destroy
  		response.should redirect_to root_path
  	end
  end

  context 'session #create' do
  	it {  expect(post: "/auth/facebook/callback").to be_routable }
  	it { expect(put: "/auth/facebook/callback").to_not be_routable }

  	it 'creates a session' do
  		session[:user_id].should be_nil
  		post :create, provider: 'facebook'
  		expect(session[:user_id]).to_not be_nil
	  end

	  it 'redirects to index' do
	  	post :create, provider: 'facebook'
  		response.should redirect_to root_path
	  end
  end
end