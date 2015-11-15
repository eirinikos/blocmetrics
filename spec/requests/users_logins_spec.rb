require 'rails_helper'

RSpec.describe "invalid login information", type: :request do
  it "prevents a new session from being created" do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { email: "", password: "" }
    assert_template 'sessions/new'
    expect(flash.empty?).to be(false)
    get root_path
    expect(flash.empty?).to be(true)
  end
end

# RSpec.describe "login with valid info, followed by logout,", type: :request do
#   before do
#     @user = users(:avocado)

#     # returns true if a test user is logged-in
#     def is_logged_in?
#       !session[:user_id].nil?
#     end
#   end
#   it "allows a new session to be created and then destroyed" do
#     get login_path
#     post login_path, session: { email: @user.email, password: 'password' }
#     assert is_logged_in?
#     assert_redirected_to @user
#     follow_redirect!
#     assert_template 'users/show'
#     assert_select "a[href=?]", login_path, count: 0
#     assert_select "a[href=?]", logout_path
#     assert_select "a[href=?]", user_path(@user)
#     delete logout_path
#     expect(is_logged_in?).to be(false)
#     assert_redirected_to root_url
#     # simulate a user clicking logout in a second window
#     delete logout_path
#     follow_redirect!
#     assert_select "a[href=?]", login_path
#     assert_select "a[href=?]", logout_path, count: 0
#     assert_select "a[href=?]", user_path(@user), count: 0
#   end
# end