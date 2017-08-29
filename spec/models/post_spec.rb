require 'rails_helper'

RSpec.describe Post, type: :model do
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
  	@post = Post.new
  	@post.title = 'a'*10
  	@post.body = 'a'*10
  		expect(@post).to be_valid
  end
end
