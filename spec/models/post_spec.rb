require 'rails_helper'
require 'support/features/sign_in.rb'

RSpec.describe Post, type: :model do
  let(:user){User.create!(username: 'exampleuser', email: 'example@user.com', password: 'password', password_confirmation: 'password')}
  it 'not valid without title' do
  	@post = Post.new
  		expect(@post).not_to be_valid
  end
  it 'not valid with title ' do
  	@post = Post.new
  	@post.title = 'a'*101
  		expect(@post).not_to be_valid
  end
  it 'valid with title and body validations ' do
  	sign_in user
    @post = Post.new
  	@post.title = 'a'*10
  	@post.body = 'a'*10
  		expect(@post).to be_valid
  end
  it 'validate user and post' do
    sign_in user
    @post = Post.new
    expect(@post).to have_a(user)
  end
end
