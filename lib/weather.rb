class Weather

def conditions
	set_conditions
end

private 

def set_conditions
	@conditions = rand(10) == 2 ? "Stormy" : "Sunny"
end

end