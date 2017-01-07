require 'plane'

describe Plane do 
	
	it {is_expected.to respond_to(:airborne)}

	it {is_expected.to respond_to(:in_air)}

	it {is_expected.to respond_to(:on_ground)}

end