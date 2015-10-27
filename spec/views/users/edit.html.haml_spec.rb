require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :name => "MyString",
      :email => "MyString",
      :state => "MyString",
      :profession => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input#user_name[name=?]", "user[name]"

      assert_select "input#user_email[name=?]", "user[email]"

      assert_select "input#user_state[name=?]", "user[state]"

      assert_select "input#user_profession[name=?]", "user[profession]"

      assert_select "textarea#user_description[name=?]", "user[description]"
    end
  end
end
