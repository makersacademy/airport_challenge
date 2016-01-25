require 'plane'


describe Plane do

	plane = Plane.new

		it 'returns an instance of plane' do
		expect(plane).to be_a(Plane)
	end

	it {is_expected.to respond_to(:land).with(1).argument}
	it {is_expected.to respond_to(:take_off)}

end












