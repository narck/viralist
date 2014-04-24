require 'spec_helper'

describe User do
  


describe "with a proper password" do
    let(:user){ FactoryGirl.create(:user) }

    it "is saved" do
      expect(user).to be_valid
      expect(User.count).to eq(1)
    end
  end

  it "has the username set correctly" do
    user = User.new username:"Budge"

    user.username.should == "Budge"
  end

  it "is not saved without a password" do
    user = User.create username:"Budge", realname:"hook", email:"asd"

    expect(user).not_to be_valid
    expect(User.count).to eq(0)	
  end
  it "is not saved without an email address" do
    user = User.create username:"Budge", realname:"hook", password:"Keka1", password_confirmation:"Keka1"


    expect(user).not_to be_valid
    expect(User.count).to eq(0) 
  end

        describe "name too short" do
    let(:user){ User.create username:"a", password:"Keka1", password_confirmation:"Keka1" }

    it "is not saved" do
      expect(user).not_to be_valid
      expect(User.count).to eq(0)
    end
	end

	describe "password only letters " do
    let(:user){ User.create username:"Budge", password:"lelalela", password_confirmation:"lelalela" }

    it "is not saved" do
      expect(user).not_to be_valid
      expect(User.count).to eq(0)
    end
	end

  describe "with a correct password" do
    let(:user){ User.create username:"Budge", realname:"hook", email:"asd@weasd.com", password:"Keka1", password_confirmation:"Keka1" }

    it "is saved" do
      expect(user).to be_valid
      expect(User.count).to eq(1)
    end
  end
end