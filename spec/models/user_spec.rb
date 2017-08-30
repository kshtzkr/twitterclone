require 'rails_helper'

RSpec.describe User, type: :model do
	let(:user){User.create!(username: 'exampleuser', email: 'example@user.com', password: 'password', password_confirmation: 'password')}
	it 'user have a post' do
		sign_in user
		expect(user).to have_many(@posts)
	end
end
