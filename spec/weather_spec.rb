require 'weather'

describe Weather do
	
	# As an air traffic controller 
	# To ensure safety
	# I want to prevent landing when weather is stormy
	it { is_expected.to respond_to :stormy?}

end