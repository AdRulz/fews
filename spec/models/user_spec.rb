require 'spec_helper'

describe User do
  let(:user) { create :user }


  describe 'email' do
    it "exist" do
      expect(user).to respond_to :email
    end
  end

  describe 'password' do
    it "exist" do
      expect(user).to respond_to :password
    end
  end

  describe 'token' do
    it "exist" do
      expect(user).to respond_to :token
    end
  end

  it "has many articles" do
    expect(subject).to have_many :articles
  end

  it "authenticable" do
    expect(user.authenticate(user.password)).to be_true
    expect(user.authenticate('randmstring')).to_not be_true
  end
end
