require 'airport'
require 'plane'
require 'number_generator'

describe Airport do 
	it { is_expected.to respond_to(:capacity) }
	it 'instructs plane to take off' do 
		airport = Airport.new
		plane = double("Plane", :landed => true, :takes_off => true)
		airport.land_plane(plane)
		airport.stub(:is_stormy?).and_return("stormy")
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
		plane = double("Plane", :landed => false, :takes_off => true)
		airport = Airport.new
		airport.land_plane(plane)
		airport.is_stormy = true
		expect { airport.fly_plane(plane) }.to raise_error(StandardError, 'Too stormy to take off')
	end
	it "prevents plane to take off when not at the different airport" do
		plane = double("Plane", :landed => true)
		airport = Airport.new
		expect { airport.fly_plane(plane) }.to raise_error(StandardError, 'This plane is not at the airport')
	end
	it "prevents plane to land when full" do 
		airport = Airport.new
		20.times do 
			plane = double("Plane", :landed => true)
			airport.land_plane(plane)
		end
		expect { airport.land_plane(Plane.new) }.to raise_error(StandardError, 'No parking space available')
	end
	it "prevents plane to land when stormy" do
		airport = Airport.new
		plane = double("Plane", :landed => false)
		airport.is_stormy = true
		expect { airport.land_plane(plane) }.to raise_error(StandardError, 'Too stormy to land')
	end
end

describe 'plane_doubles' do 
	it "expects the message 'takes_off' and return true" do
		plane = double("Plane", :landed => true)
		plane.stub(:takes_off).and_return(true)
		plane.takes_off.should eq(true)
	end
end

