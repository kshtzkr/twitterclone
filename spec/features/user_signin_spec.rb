require 'rails_helper'

RSpec.describe 'user signing in' do
	# before(:each) do
		let(:user) { create(:user)}
	# end
	scenario 'successfully' do
		sign_in user

		expect(page).to have_content user.email
	end
	scenario 'unsuccessfully' do
		visit new_user_session_path
		fill_in 'Email', with: user.email
		fill_in 'Password', with: 'wrongpassword'
		click_on 'Log in'

		expect(page).not_to have_content user.email
	end 
end