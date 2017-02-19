require 'airport'

describe Airport do
  subject(:airport) { described_class.new }

  describe "#instruct_land", :focus => true do
    let(:plane_air) { double :plane_air, landed?: false, land: airport }
    let(:plane_landed) { double :plane_landed, landed?: true}

    it "can tell a plane to land" do
      expect(airport).to respond_to(:land_plane)
    end
    it "adds a plane to the airport if it lands" do
      allow(airport).to receive(:sunny?) {true}
      airport.land_plane(plane_air)
      expect(airport.planes.last).to eq plane_air
    end
    it "raise an error if the weather is stormy" do
      allow(airport).to receive(:sunny?) {false}
      expect{airport.land_plane(plane_air)}.to raise_error("The weather at the airport is stormy, you cannot land.")
    end
    it "raise an error if the plane passed is already landed" do
      expect{airport.land_plane(plane_landed)}.to raise_error("This plane is already on the ground.")
    end
    it "raise an error if the airport is full" do
      allow(airport).to receive(:sunny?) {true}
      airport.capacity.times {airport.land_plane(plane_air)}
      expect{airport.land_plane(plane_air)}.to raise_error("Sorry, this airport is full.")
    end
  end

  describe "#permit_takeoff" do
    let(:plane_air) { double :plane_air, landed?: false }
    let(:plane_landed) { double :plane_landed, landed?: true, airport: airport }
    let(:airport_two) { described_class.new }

    it "can tell a plane to takeoff" do
      expect(airport).to respond_to(:permit_takeoff)
    end
    it "takeoff if the weather is sunny" do
      allow(airport).to receive(:sunny?) {true}
      allow(plane_landed).to receive(:takeoff)
      airport.planes.push(plane_landed)
      expect(airport.permit_takeoff(plane_landed)).to eq plane_landed
    end
    it "raise an error if the weather is stormy" do
      allow(airport).to receive(:sunny?).and_return(false)
      expect{airport.permit_takeoff(plane_landed)}.to raise_error("The weather at the airport is stormy, you cannot takeoff.")
    end
    it "raise an error if the plane passed is already in the air" do
      expect{airport.permit_takeoff(plane_air)}.to raise_error("This plane is already in the air.")
    end
    it "raise an error if the plane passed is landed but not at this airport" do
      allow(airport_two).to receive(:sunny?) {true}
      allow(plane_landed).to receive(:takeoff)
      expect{airport_two.permit_takeoff(plane_landed)}.to raise_error("This plane is at a different airport.")
    end
    it "removes the plane from an airport if it has taken off" do
      allow(airport).to receive(:sunny?) {true}
      allow(plane_air).to receive(:land).and_return(airport)
      airport.land_plane(plane_air)
      allow(plane_air).to receive(:landed?).and_return(true)
      allow(plane_air).to receive(:takeoff)
      airport.permit_takeoff(plane_air)
      expect(airport.planes.length).to eq 0
    end
  end

end
