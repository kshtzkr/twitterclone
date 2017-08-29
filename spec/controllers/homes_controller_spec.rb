require 'rails_helper'

RSpec.describe HomesController, type: :controller do
	describe 'show controller' do
		it 'render the show templates' do
			get :show
			expect(response).to render_template :show
		end

	end
end
