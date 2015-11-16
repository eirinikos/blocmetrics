# require 'rails_helper'

# RSpec.describe "unsuccessful user profile edit", type: :request do
#   before do
#     @user = users(:avocado)
#   end
#   it "re-renders the edit page" do
#       get edit_user_path(@user)
#       assert_template 'users/edit'
#       patch user_path(@user), user: {
#         name: "", email: "foo@invalid",
#         password: "foo",
#         password_confirmation: "bar" }
#       assert_template 'users/edit'
#   end

#   it "triggers a flash message & redirect to the profile page" do
#       get edit_user_path(@user)
#       assert_template 'users/edit'
#       name = "Foo Bar"
#       email = "foo@bar.com"
#       patch user_path(@user), user: {
#         name: name, email: email,
#         password: "",
#         password_confirmation: "" }
#       expect( flash.empty? ).to be(false)
#       assert_redirected_to @user
#       @user.reload
#       expect( name ).to eq( @user.name )
#       expect( email ).to eq( @user.email )
#   end
# end
