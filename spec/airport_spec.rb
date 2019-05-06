require 'airport'

describe Airport do

  describe "account for random weather value" do
    it "returns stormy weather" do
      airport = Airport.new
      allow(airport).to receive(:weather).and_return "stormy"
      expect(airport.weather).to eq("stormy")
    end

    it "returns sunny weather" do
      airport = Airport.new
      allow(airport).to receive(:weather).and_return "sunny"
      expect(airport.weather).to eq("sunny")
    end
  end

  describe '#land' do
    it 'lands a plane' do
      plane = Plane.new
      airport = Airport.new
      expect(airport.land(plane)).to include(plane)
    end

    it 'raises error when we try to land the same plane twice' do
      plane = Plane.new
      airport = Airport.new
      airport.land(plane)
      expect {
        airport.land(plane)
      }.to raise_error("Plane already at the airport!")
    end
  end

  describe '#take_off' do
    it 'takes off a plane' do
      plane = Plane.new
      airport = Airport.new
      allow(airport).to receive(:weather).and_return "sunny"
      airport.land(plane)
      n = airport.planes.length
      expect(airport.take_off(plane).length).to eq(n - 1)
    end

    it 'raises error if it is stormy' do
      plane = Plane.new
      airport = Airport.new
      allow(airport).to receive(:weather).and_return "stormy"
      airport.land(plane)
      message = "Too stormy to take off right now"
      expect{airport.take_off(plane)}.to raise_error(message)
    end

    it 'takes off a specified plane' do
      plane1 = Plane.new
      plane2 = Plane.new
      airport = Airport.new
      allow(airport).to receive(:weather).and_return "sunny"
      airport.land(plane1)
      airport.land(plane2)
      expect(airport.take_off(plane1)).not_to include(plane1)
    end
  end

end
