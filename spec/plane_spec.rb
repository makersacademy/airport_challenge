require 'plane'

describe Plane do
	 subject(:plane) { described_class.new }

	# As an air traffic controller
	# So I can get passengers to a destination 
	# I want to instruct a plane to land at an airport
	 it { is_expected.to respond_to :land }

	# As an air traffic controller
	# So I can get passengers on the way to their destination 
	# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
	 it { is_expected.to respond_to :take_off }

	# Your code should defend against edge cases such as
	# inconsistent states of the system ensuring that planes
	# can only take off from airports they are in; planes
	# that are already flying cannot takes off and/or be in
	# an airport; planes that are landed cannot land again
	# and must be in an airport, etc.

end
