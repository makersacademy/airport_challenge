require 'airport'
describe Airport do
it { is_expected.to respond_to(:land).with(1).argument }

	it '#land' do
	airport = described_class.new
	plane = double(:plane)
	airport.land(plane)
	expect(airport.planes).to include plane
	end	
end