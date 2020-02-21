require 'airport'
require 'plane'

describe Airport do 
	it { is_expected.to respond_to(:capacity) }
	it 'instructs plane to take off' do 
		airport = Airport.new
		plane = double("Plane", :lands => true, :takes_off => true)
		airport.fly_plane(plane)
		expect(airport.planes).not_to include(plane)
	end
	it "instructs plane to land" do
		airport = Airport.new
		plane = double("Plane", :lands => true)
		airport.land_plane(plane)
		expect(airport.planes).to include(plane)
	end
	it "prevents plane to take off" do
	end
	it "prevents plane to land" do 
	end
end
