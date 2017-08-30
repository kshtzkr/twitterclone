require 'rails_helper'

RSpec.describe 'creating post' do 
	let(:user){User.create!(username: 'exampleuser', email: 'example@user.com', password: 'password', password_confirmation: 'password')}
	scenario 'creating post successfully' do
		sign_in user
		visit root_path
		click_on 'Write a story'

		fill_in 'Title', with: 'My first post'
		fill_in 'Body', with: 'some awesome contents'
		click_on 'Publish'

		within('.posts') do
			expect(page).to have_content 'My first post'
			expect(page).to have_content 'exampleuser'
		end
	end

	scenario 'creating post unsuccessfully' do
		sign_in user
		visit root_path
		click_on 'Write a story'

		fill_in 'Title', with: 'My first post'
		fill_in 'Body', with: ''
		click_on 'Publish'

		expect(page).to have_css '.error'
		# expect(current_path).to eq(new_post_path)
	end

	scenario 'non-logged user cannot create post' do
		visit root_path
		click_on 'Write a story'

		expect(current_path).to eq(new_user_session_path)
	end
end