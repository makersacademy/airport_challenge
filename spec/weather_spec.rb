require 'weather'

describe Weather do
	subject(:weather){ described_class.new }
	
	# As an air traffic controller 
	# To ensure safety
	# I want to prevent landing when weather is stormy
	it { is_expected.to respond_to :stormy? }

	# You will need to use a random number generator to
	# set the weather (it is normally sunny but on rare 
	# occasions it may be stormy). In your tests, you'll 
	# need to use a stub to override random weather to
	# ensure consistent test behaviour.

end