require 'airport'
require 'plane'

describe Airport do 
	it { is_expected.to respond_to(:capacity) }
	it 'instructs plane to take off' do 
		airport = Airport.new
		plane = double("Plane", :landed => true)
		plane.stub(:takes_off).and_return(true)
		airport.fly_plane(plane)
		expect(airport.planes).not_to include(plane)
	end
	it "instructs plane to land" do
		airport = Airport.new
		plane = double("Plane", :landed => true)
		airport.land_plane(plane)
		expect(airport.planes).to include(plane)
	end
	it "prevents plane to take off" do
	end
	it "prevents plane to land" do 
	end
end

describe 'plane_doubles' do 
	it "expects the message 'takes_off' and return true" do
		plane = double("Plane", :landed => true)
		plane.stub(:takes_off).and_return(true)
		plane.takes_off.should eq(true)
	end
end

