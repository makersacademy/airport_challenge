require 'airport'

describe Airport do

	subject {Airport.new(3)}

	it {is_expected.to respond_to(:arriving)}

	it {is_expected.to respond_to(:full?)}

end