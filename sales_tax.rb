class Goods
	attr_accessor(:quantity, :name, :cost, :item_sales_tax) 

	def initialize(quantity, name, cost)
		@quantity = quantity.to_i
		@name = name.to_s
		@cost = cost.to_f
		@sales_tax_rate = 0.to_f
	end 

	def calculate
		#IMPORTED?
		if @name.include?("imported")
			@sales_tax_rate += 0.05
		end

		if !(@name.include?("pills")||@name.include?("book")||@name.include?("chocolate"))
			@sales_tax_rate+=0.1
		end
		
			@item_sales_tax = (@cost * @sales_tax_rate)
			@cost = @cost + @item_sales_tax 
	end 

	def output_items
		puts "#{quantity} #{name} : #{cost}"
	end 

	def output_taxes_and_total

	end 

end

input = File.readlines("open.txt")

purchased_goods = [] 

input.each {|line|
	purchased_goods << line.split(" ") 
}

list_of_goods = [] 

purchased_goods.each {|item|
	item.delete("at")
	good = Goods.new(item[0], item[1..-2].join(" "), item[-1])
	list_of_goods << good 
}

total_cost = 0 
total_tax = 0 

list_of_goods.each {|item|
	item.calculate	
	item.output_items
	total_cost += item.cost
	total_tax += item.item_sales_tax 
}

if total_tax%0.05 >= 0.25 
	total_tax -= ((total_tax+0.05) % 0.05)
elsif  total_tax%0.05 < 0.25
	total_tax -= (total_tax % 0.05)
end 

puts "Sales Taxes: #{total_tax}"
puts "Total: #{total_cost}"