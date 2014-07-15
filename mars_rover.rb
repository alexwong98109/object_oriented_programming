class Coordinates 
	attr_accessor :max_x, :max_y
	def initialize (max_x ,max_y)
		@max_x = max_x.to_i
		@max_y = max_y.to_i
	end
end  

class Rovers
	attr_accessor :x, :y, :direction
	def initialize (x,y,direction)
		@x = x.to_i 
		@y = y.to_i
		@direction = direction 
	end 

	def left 
		if @direction == "N"
			@direction = "W"
		elsif @direction == "W"
			@direction = "S"
		elsif @direction == "S"
			@direction = "E"
		elsif @direction == "E"
			@direction = "N"
		end 				
	end

	def right
		if @direction == "N"
			@direction = "E"
		elsif @direction == "E"
			@direction = "S"
		elsif @direction == "S"
			@direction = "W"
		elsif @direction == "W"
			@direction = "N"
		end			
		
	end

	def move   
		if @direction == "N"
			@y += 1
		elsif @direction== "S"
			@y -=1
		elsif @direction == "E"
			@x  += 1
		elsif @direction == "W"
			@x -= 1
		end 
	end

	def to_s
		"#{@x} #{@y} #{direction}"
	end 
end 

#Acquiring the uppermost left corner coordinates
top_left_coordinates = Coordinates.new (gets.chomp, gets.chomp)


#Rover 1
rover1 = Rovers.new(gets.chomp,gets.chomp,gets.chomp) 

rover1_instructions = gets.chomp

rover1_instructions.each_char {|instruction|
	if instruction == "L"
		rover1.left
	elsif instruction == "R"
		rover1.right
	elsif instruction == "M"
		rover1.move
	end 
}


#Rover 2
rover2 = Rovers.new(gets.chomp,gets.chomp,gets.chomp) 

rover2_instructions = gets.chomp

rover2_instructions.each_char {|instruction|
	if instruction == "L"
		rover2.left
	elsif instruction == "R"
		rover2.right
	elsif instruction == "M"
		rover2.move
	end 
}


puts rover1
puts rover2 