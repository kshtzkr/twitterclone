require 'rails_helper'

RSpec.feature 'users visit homepage' do
	scenario 'successfully and sees a logo ' do
		visit root_path
		expect(page).to have_content 'MyApp'
	end
end