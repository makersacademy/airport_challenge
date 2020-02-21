require 'airport'
require 'plane'

describe Airport do 
	it { is_expected.to respond_to(:capacity) }
	it 'instructs plane to take off' do 
		airport = Airport.new
		plane = double("Plane", :landed => true)
		plane.stub(:takes_off).and_return(true)
		airport.planes << plane
		expect(airport.fly_plane(plane)).to eq("Plane #{plane} has taken off")
		expect(airport.planes).not_to include(plane)
	end
	it "instructs plane to land" do
		airport = Airport.new
		plane = double("Plane", :landed => true)
		airport.land_plane(plane)
		expect(airport.planes).to include(plane)
	end
	it "prevents plane to take off when stormy" do
	end
	it "prevents plane to take off when it's at a different airport" do
		plane = double("Plane", :landed => true)
		airport = Airport.new
		expect { airport.fly_plane(plane) }.to raise_error(StandardError, 'This plane is at a different airport')
	end
	it "prevents plane to land when full" do 
	end
	it "prevents plane to land when stormy" do 
	end
end

describe 'plane_doubles' do 
	it "expects the message 'takes_off' and return true" do
		plane = double("Plane", :landed => true)
		plane.stub(:takes_off).and_return(true)
		plane.takes_off.should eq(true)
	end
end

