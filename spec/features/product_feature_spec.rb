require 'spec_helper'

def create_product(name,description,price)
  Product.create({:name => name, :description => description, :price => price})
end

describe 'products' do

	before(:all) do
    	create_product('Specialized','Fast and sleek this bike is good',100.00)
  	end
		
		it 'should show a list of products for sale' do
			visit '/'
			expect(page).to have_content 'Specialized'
			expect(page).to have_content 100.00
		end

		it 'should be able to add a new product' do
			visit new_product_path
			fill_in 'Name', with: 'Giant'
			fill_in 'Description', with: 'Bigger is better'
			fill_in 'Price', with: 150.00

			click_button'Add New Product'

			expect(page).to have_content 'Bigger is better'
		end

		it 'can upload an image for a product' do
			visit new_product_path

			fill_in 'Name', with: 'Hoy'
			fill_in 'Description', with: 'Live the olympic dream'
			fill_in 'Price', with: 220.00

			page.attach_file('product[product_image]', 'spec/helpers/images/pinkbike.jpg')

			click_button 'Add New Product'

			expect(page).to have_content 'Live the olympic dream'
			expect(page).to have_css 'img[src*="pinkbike.jpg"]'
			# expect(page).should have_attached_file :pinkbike
		end	

		it 'should be able to update details' do
			visit '/'
			click_link 'Specialized'
			click_link 'Edit'
			fill_in 'Description', with: 'Latest model now available'

			click_button 'Update'

			expect(page).to have_content 'Latest model now available'
		end


		it 'should have an attached file' do
			Product.create :name => 'Hoy', :description => 'Live the Olympic dream', :price => 300, :product_image => File.open(Rails.root.join("spec", "helpers/images", "pinkbike.jpg"))
			visit '/'
			expect(page).to have_css 'img[src*="pinkbike.jpg"]'
		end


end