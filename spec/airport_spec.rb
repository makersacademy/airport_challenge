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
      allow(airport).to receive(:weather).and_return "sunny"
      expect(airport.land(plane)).to include(plane)
    end

    it 'raises error when we try to land the same plane twice' do
      plane = Plane.new
      airport = Airport.new
      allow(airport).to receive(:weather).and_return "sunny"
      airport.land(plane)
      message = "Plane already at the airport!"
      expect { airport.land(plane) }.to raise_error(message)
    end

    it 'raises error if it is stormy' do
      plane = Plane.new
      airport = Airport.new
      allow(airport).to receive(:weather).and_return "stormy"
      message = "Too stormy to land right now"
      expect { airport.land(plane) }.to raise_error(message)
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

    it 'takes off a specified plane' do
      plane1 = Plane.new
      plane2 = Plane.new
      airport = Airport.new
      allow(airport).to receive(:weather).and_return "sunny"
      airport.land(plane1)
      airport.land(plane2)
      expect(airport.take_off(plane1)).not_to include(plane1)
    end

    it 'raises error if it is stormy' do
      plane = Plane.new
      airport = Airport.new
      allow(airport).to receive(:weather).and_return "sunny"
      airport.land(plane)
      allow(airport).to receive(:weather).and_return "stormy"
      message = "Too stormy to take off right now"
      expect { airport.take_off(plane) }.to raise_error(message)
    end

    it 'raises an error if plane at a different airport' do
      plane1 = Plane.new
      plane2 = Plane.new
      airport1 = Airport.new
      allow(airport1).to receive(:weather).and_return "sunny"
      airport2 = Airport.new
      allow(airport2).to receive(:weather).and_return "sunny"
      airport1.land(plane1)
      airport2.land(plane2)
      message = "Specified plane not at this airport"
      expect { airport1.take_off(plane2) }.to raise_error(message)
    end

    it 'raises error when we try to take off the same plane twice' do
      plane = Plane.new
      airport = Airport.new
      allow(airport).to receive(:weather).and_return "sunny"
      airport.land(plane)
      airport.take_off(plane)
      message = "Specified plane not at this airport"
      expect { airport.take_off(plane) }.to raise_error(message)
    end
  end

end
