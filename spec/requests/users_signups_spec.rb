require 'rails_helper'

RSpec.describe "invalid signup information", type: :request do
  it "prevents a new user from being created" do
    get signup_path
    before_count = User.count
    post users_path, user: {  name:  "",
                              email: "user@invalid",
                              password:  "foo",
                              password_confirmation: "bar" }
    after_count = User.count
    assert_equal before_count, after_count
    assert_template 'users/new'
  end
end

RSpec.describe "valid signup information", type: :request do
  it "allows a new user to be created" do
    # returns true if a test user is logged-in
    def is_logged_in?
      !session[:user_id].nil?
    end

    get signup_path
    before_count = User.count
    post_via_redirect users_path, user: {  name:  "Avocado Jones",
                              email: "avocado@jones.org",
                              password:  "foobar",
                              password_confirmation: "foobar" }
    after_count = User.count
    expect(after_count).to eq(1)
    assert_template 'users/show'
    assert is_logged_in?
  end
end