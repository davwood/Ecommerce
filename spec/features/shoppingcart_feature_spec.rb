require 'spec_helper'

describe 'the cart' do

	let (:hoy) {FactoryGirl.create(:product)}

	it 'should initially be empty' do
		visit product_path(hoy)
		expect(page).to have_css '.item_count', text: '0 items'
	end

	it 'can have items added to it' do
		visit product_path(hoy)
		click_button 'Add to Cart'
		
		expect(page).to have_css '.item_count', text: '1 item'
	end

	it 'shows the total of all items in the cart' do
		visit product_path(hoy)
		click_button 'Add to Cart'

		expect(page).to have_css '.cart_total', text: 'Total: 300'
	end

	it 'displays products in the cart' do
		visit product_path(hoy)
		click_button 'Add to Cart'

		click_link 'My Cart'

		expect(page).to have_css '.cart_details', text: 'Hoy'
	end

	it 'removes an item' do
		visit product_path(hoy)
		click_button 'Add to Cart'
		click_link 'My Cart'

		click_button 'Remove from cart'

		expect(page).to have_content 'Product Hoy removed'
	end

end