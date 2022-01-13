require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'should not create a user if password and confirmation do not match' do
      @user = User.new({ name: 'Person Guy', email: 'bob@testmail.com', password: '416', password_confirmation: '321'})
      expect(@user).not_to be_valid
    end

    it 'should create a new user if password and confirmation match' do
      @user = User.new({ name: 'Person Guy', email: 'personemail@site.com', password: '416', password_confirmation: '416'})
      expect(@user).to be_valid
    end
    
    it 'should not create a new user if email is taken' do
      @user1 = User.create({ name: 'Person Guy', email: 'personemail@site.com', password: '416', password_confirmation: '416'})
      @user2 = User.create({ name: 'Person Guy', email: 'personemail@site.com', password: '416', password_confirmation: '416'})
      expect(@user2).not_to be_valid
    end

    it 'should not create a new user if the password is less than 3' do
      @user = User.new({ name: 'Person Guy', email: 'personemail@site.com', password: '12', password_confirmation: '12'})
      expect(@user).not_to be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should authenticate a user by email and password' do
      user = User.create({ name: 'Person Guy', email: 'personemail@site.com', password: '416', password_confirmation: '416'})
      expect(user).to eql(User.authenticate_with_credentials('personemail@site.com', '416'))
    end

    it 'should authenticate a user if the email has spaces after' do
      user = User.create({ name: 'Person Guy', email: 'personemail@site.com', password: '416', password_confirmation: '416'})
      expect(user).to eql(User.authenticate_with_credentials(' personemail@site.com ', '416'))
    end

    it 'should authenticate a user based on their email regardless of case' do
      user = User.create({ name: 'Person Guy', email: 'personemail@site.com', password: '416', password_confirmation: '416'})
      expect(user).to eql(User.authenticate_with_credentials('pErsoNemaIl@sitE.com', '416'))
    end
  end
end