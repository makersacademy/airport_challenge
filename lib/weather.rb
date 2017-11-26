class Weather

def conditions
	rand_conditions
end

private 

def rand_conditions
	@conditions = rand(10) == 2 ? "Stormy" : "Sunny"
end

end