require 'airport'
require 'weather'

describe Airport do

  let(:plane) { double :plane }
  let(:weather) {double :weather, :stormy? => false}

  subject(:airport) { Airport.new(weather) }

  describe '#land' do
    it 'lands plane' do
      allow(plane).to receive(:airborne?).and_return(true)
      expect(airport.land(plane)).to eq [plane]
    end

    it 'stores plane when it lands' do
      allow(plane).to receive(:airborne?).and_return(true)
      airport.land(plane)
      expect(airport.planes).to include plane
    end

    it 'stores more than one plane that lands' do
      plane2 = Plane.new
      allow(plane).to receive(:airborne?).and_return(true)
      airport.land(plane)
      airport.land(plane2)
      expect(airport.planes).to eq([plane, plane2])
    end

    it 'cannot land if already landed' do
      allow(plane).to receive(:airborne?).and_return(true)
      airport.land(plane)
      allow(plane).to receive(:airborne?).and_return(false)
      expect { airport.land(plane) }.to raise_error "Plane has already landed"
    end

  end

  describe '#take_off' do

    it 'takes off plane' do
      allow(plane).to receive(:airborne?).and_return(true)
      airport.land(plane)
      allow(plane).to receive(:airborne?).and_return(false)
      allow(weather).to receive(:stormy?).and_return(false)
      expect(airport.take_off(plane)).to eq []
    end

    it 'cannot take off if airborne' do
      allow(plane).to receive(:airborne?).and_return(true)
      airport.land(plane)
      allow(plane).to receive(:airborne?).and_return(false)
      allow(weather).to receive(:stormy?).and_return(false)
      airport.take_off(plane)
      allow(plane).to receive(:airborne?).and_return(true)
      expect { airport.take_off(plane) }.to raise_error "Plane has already taken off"
    end

    it 'does not take off if weather is stormy' do
      allow(plane).to receive(:airborne?).and_return(true)
      airport.land(plane)
      allow(plane).to receive(:airborne?).and_return(false)
      allow(weather).to receive(:stormy?).and_return(true)
      #weather = double("weather", :stormy? => true)
      expect { airport.take_off(plane) }.to raise_error "Stormy weather"
    end
  end

end
