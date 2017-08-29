require 'rails_helper'

RSpec.describe 'creating post' do 
	scenario 'creating post successfully' do
		visit root_path
		click_on 'Write a story'

		fill_in 'Title', with: 'My first post'
		fill_in 'Body', with: 'some awesome contents'
		click_on 'Publish'

		expect(page).to have_content 'My first post'
	end

	scenario 'creating post unsuccessfully' do
		visit root_path
		click_on 'Write a story'

		fill_in 'Title', with: 'My first post'
		fill_in 'Body', with: ''
		click_on 'Publish'

		expect(page).to have_css '.error'
		# expect(current_path).to eq(new_post_path)
	end
end