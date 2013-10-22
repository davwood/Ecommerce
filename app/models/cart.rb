class Cart < ActiveRecord::Base
	has_and_belongs_to_many :products

	def count
		products.count
	end

	def total
		prices_array = products.map {|x| x.price.to_i}
		total = prices_array.inject {|sum,n| sum + n}

		# return prices
		# products.inject {|total, product| total.price.to_i + product.price.to_i}
	end
end
