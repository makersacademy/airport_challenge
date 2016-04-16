require 'plane'

describe Plane do
	it {is_expected.to respond_to(:land)}
	it {is_expected.to respond_to(:take_off)}
  
  describe "#take off" do
  	it {is_expected.to respond_to(:landed?)}
  end


# plane1 = Plane.new
# plane2 = Plane.new

end

