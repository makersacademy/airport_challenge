require "plane.rb"
require "airport.rb"

test_max_capacity = 10

describe "Airport and Plane:" do
  let(:airport) { Airport.new("sunny", test_max_capacity) }
  let(:plane) { Plane.new }

  it "create a plane inside the airport" do
    test_plane = Plane.new(airport)
    expect(test_plane.location).to eq airport
    expect(airport.planes).to include(test_plane)
  end
  context "good weather:" do
    it "plane lands at the airport" do
      expect(airport.planes).not_to include(plane)
      expect(plane.location).not_to eq airport
      plane.land(airport)
      expect(airport.planes).to include(plane)
      expect(plane.location).to eq airport
    end

    it "plane takes off from airport" do
      airport.instance_variable_set(:@planes, [plane, Plane.new])
      plane.instance_variable_set(:@location, airport)
      plane.takeoff
      expect(airport.planes).not_to include(plane)
      expect(plane.location).to eq :in_flight
    end
  end
  
  context "bad weather:" do
    before do
      airport.instance_variable_set(:@weather, "stormy")
      airport.instance_variable_set(:@planes, [])
    end

    it "plane cannot land at the airport" do
      expect { plane.land(airport) }.to raise_error("Not safe to land")
      expect(airport.planes).not_to include(plane)
      expect(plane.location).to eq :in_flight
    end

    it "plane cannot take off from the airport" do
      airport.instance_variable_set(:@planes, [plane, Plane.new])
      plane.instance_variable_set(:@location, airport)
      expect { plane.takeoff }.to raise_error("Not safe to takeoff")
      expect(airport.planes).to include(plane)
      expect(plane.location).to eq airport
    end
  end

  context "multiple planes" do
    before do
      airport.instance_variable_set(:@planes, [])
    end

    it "3 planes land at the airport" do
      landing_planes = (1..3).map { Plane.new }
      (0..2).each do |i|
        landing_planes[i].land(airport)
        expect(airport.planes).to include(landing_planes[i])
        expect(landing_planes[i].location).to eq airport
      end
    end

    it "3 planes try to land, but airport is full after 2nd" do
      airport.instance_variable_set(:@planes, (1..test_max_capacity - 2).map { Plane.new })
      expect(airport.planes.size).to eq test_max_capacity - 2
      2.times { new_plane = Plane.new; new_plane.land(airport) }
      expect(airport.planes.size).to eq test_max_capacity
      expect { plane.land(airport) }.to raise_error("Airport is full")
      expect(airport.planes.size).to eq test_max_capacity
      expect(plane.location).to eq :in_flight
    end
  end

  context "weather changes for the worse" do
    let(:plane1) { Plane.new }
    let(:plane2) { Plane.new }
    before(:each) do
      airport.instance_variable_set(:@weather, "sunny")
    end

    it "while planes land" do
      plane1.land(airport)
      airport.instance_variable_set(:@weather, "stormy")
      expect { plane2.land(airport) }.to raise_error("Not safe to land")
    end
    
    it "while planes take off" do
      airport.instance_variable_set(:@planes, [plane1, plane2])
      plane1.instance_variable_set(:@location, airport)
      plane2.instance_variable_set(:@location, airport)
      plane1.takeoff
      airport.instance_variable_set(:@weather, "stormy")
      expect { plane2.takeoff }.to raise_error("Not safe to takeoff")
    end
  end

  context "weather changes for the best" do
    before(:each) do
      airport.instance_variable_set(:@weather, "stormy")
    end

    it "while planes land" do
      plane.instance_variable_set(:@location, :in_flight)
      expect { plane.land(airport) }.to raise_error("Not safe to land")
      airport.weather = "sunny"
      plane.land(airport)
      expect(airport.planes).to include(plane)
    end

    it "while planes takeoff" do
      plane.instance_variable_set(:@location, airport)
      airport.instance_variable_set(:@planes, [plane])
      expect { plane.takeoff }.to raise_error("Not safe to takeoff")
      airport.weather = "sunny"
      plane.takeoff
      expect(airport.planes).not_to include plane
      expect(plane.location).to eq :in_flight
    end
  end
end
