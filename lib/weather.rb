class Weather

def conditions
	rand_conditions
end

private 

def rand_conditions
	@conditions = rand(10) == 1 ? "Stormy" : "Sunny"
end

end