require 'rails_helper'
require 'test_helper'

describe UsersController, type: :controller do
  it "should redirect to index page after user is created" do
    new_user_record = {:image => sample_file('1.txt'), :name => 'test', :state => 'Iowa', :city=>'d', :profession => 'student', :description => 'g'}
    post new_user_path new_user_record
    expect(response).to redirect_to users_path
  end
 
  it "should set flash success when user is created" do
    new_user_record = {:image => sample_file('1.txt'), :name => 'test', :state => 'Iowa', :city=>'d', :profession => 'student', :description => 'g'}
    post new_user_path new_user_record
    expect(flash[:notice]).to be_present
  end
end
