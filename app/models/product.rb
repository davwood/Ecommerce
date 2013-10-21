class Product < ActiveRecord::Base	
  	has_attached_file :product_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "missing.jpg"
end
