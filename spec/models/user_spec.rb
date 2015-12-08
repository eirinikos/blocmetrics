require 'rails_helper'

describe User do
  describe "validations -" do

    before do
      @user = User.new(name: "Avocado Jones", email: "avocado@jones.com",
                        password: "foobar", password_confirmation: "foobar")
    end

    describe "valid model object" do
      it "is valid" do
        assert @user.valid?
      end
    end

    describe "name validation" do
      it "invalidates a blank string name" do
        @user.name = "    "
        expect( @user.valid? ).to eq(false)
      end

      it "invalidates a name longer than 50 characters" do
        @user.name = "a" * 51
        expect( @user.valid? ).to eq(false)
      end
    end

    describe "email validation" do
      it "invalidates a blank string email" do
        @user.email = "    "
        expect( @user.valid? ).to eq(false)
      end

      it "invalidates an email longer than 255 characters" do
        @user.email = "a" * 244 + "@avocado.com"
        expect( @user.valid? ).to eq(false)
      end

      it "accepts addresses with valid formats" do
        valid_addresses = %w{avocado@jones.com avo@cado.jones.org
                            avocado@jones.co.jp avo.cado@jones.edu}
        valid_addresses.each do |valid_address|
          @user.email = valid_address
          assert @user.valid?, "#{valid_address.inspect} should be valid."
        end
      end

      it "rejects invalid addresses" do
        invalid_addresses = %w{avocado@jones,com avocado.jones.org
                              avocado@jones+joans.com}
        invalid_addresses.each do |invalid_address|
          @user.email = invalid_address
          expect( @user.valid? ).to be(false)
        end
      end

      it "rejects duplicate addresses" do
        duplicate_user = @user.dup

        # test for case insensitivity
        duplicate_user.email = @user.email.upcase
        @user.save
        expect( duplicate_user.valid? ).to be(false)
      end
    end

    describe "password validation" do
      it "rejects a blank string password" do
        @user.password = @user.password_confirmation = " " * 6
        expect( @user.valid? ).to be(false)
      end

      it "rejects passwords less than 5 characters long" do
        @user.password = @user.password_confirmation = "a" * 5
        expect( @user.valid? ).to be(false)
      end
    end

    # describe "authenticated?" do
    #   it "should return false for a user with nil digest" do
    #   assert_not @user.authenticated?(:remember, '')
    #   end
    # end
  end
end