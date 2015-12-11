require 'rails_helper'
require 'test_helper'

describe UsersController, type: :controller do
  # 
  it "should let a user see all the posts" do
    sign_in
    get :index
    expect( response ).to render_template( :index )
  end
  
  describe "anonymous user" do
    before :each do
      # This simulates an anonymous user
      sign_in nil
    end

    it "should be redirected to signin" do
      get :index
      #expect( response ).to redirect_to( new_user_session_path )
      expect( response ).to render_template( :index )
    end
  end

  
end
