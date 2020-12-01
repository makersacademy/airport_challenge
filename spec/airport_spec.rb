require 'airport'

describe Airport do

  let(:plane) { Plane.new }
  let(:another_plane) { Plane.new }
  let(:airport) { Airport.new }

  describe "#initialize" do
    it "is an instance of the airport class" do
      expect(airport).to be_instance_of(Airport)
    end

    it "has a hangar with no planes in" do
      expect(airport.hangar.length).to eq 0
    end

    it "has a default capacity of 100" do
      expect(airport.capacity).to eq 100
    end
  end

  describe "#land" do

    it "can land a plane" do
      expect(airport).to respond_to(:land).with(1).argument
    end

    it "stores the landed plane in the hangar" do
      airport.land(plane)
      expect(airport.hangar).to include(plane)
    end

    it "raises an error if airport is full" do
      airport.capacity.times do
        airport.land plane
      end
      expect { airport.land another_plane }.to raise_error "Airport is full"
    end

  end

  describe "#take_off" do

    it "instructs a plane to take off" do
      expect(airport).to respond_to(:take_off).with(1).argument
    end

    it "only lets planes that are in the airport take off" do
      message = "The plane cannot take off because it is not in the airport"
      expect { airport.take_off(plane) }.to raise_error message
    end

    it "confirms a plane that has taken off is not in the airport" do
      airport.land(plane)
      airport.land(another_plane)
      airport.take_off(plane)
      expect(airport.hangar).not_to include plane
    end

  end

end
