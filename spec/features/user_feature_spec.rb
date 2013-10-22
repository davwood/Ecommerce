require 'spec_helper'

describe 'user' do 

	it 'should be able to sign up' do
		visit '/'
		click_link 'Sign up'

		fill_in 'First name', with: "Bob"
		fill_in 'Last name', with: "Smith"
		fill_in 'Email', with: "bob@gmail.com"
		fill_in 'Password', with: '12345678'
		fill_in 'Password confirmation', with: '12345678'

		click_button 'Sign up'

		expect(page).to have_content 'Welcome!'
	end

end