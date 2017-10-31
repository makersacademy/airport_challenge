require 'airport'
require 'weather'

describe Airport do

  let(:plane) { double(:plane, :flying? => true, :change_status => false) }
  let(:plane2) { double(:plane, :flying? => true, :change_status => false) }
  let(:landed_plane) { double(:landed_plane, :flying? => false) }
  let(:bad_weather) { double(:bad_weather, :stormy? => true) }
  let(:good_weather) { double(:good_weather, :stormy? => false) }

  describe '#land(plane)' do
    it 'lands a plane' do
      expect(subject).to respond_to(:land).with(1).argument
    end
    it 'raises error when stormy' do
      airport = Airport.new(20, bad_weather)
      expect { airport.land(plane) }.to raise_error "Too stormy to land!"
    end
    it 'raises error when airport is full' do
      airport = Airport.new(20, good_weather)
      expect { 21.times { airport.land(plane) } }.to raise_error "Airport is currently full!"
    end
    it 'raises error when trying to land a plane that is not flying' do
      airport = Airport.new(20, good_weather)
      expect { airport.land(landed_plane) }.to raise_error "Cannot land plane that is not flying!"
    end
  end

  describe '#takeoff' do

    before(:each) do
      @airport = Airport.new(20, good_weather)
      @airport.land(plane)
    end

    it 'plane takes off and is no longer in airport' do
      @airport.land(plane2)
      allow(plane).to receive(:flying?).and_return(false)
      @airport.takeoff(plane)
      expect(@airport.planes.include?(plane)).to eq(false)
    end

    it 'it raises error when stormy' do
      allow(good_weather).to receive(:stormy?) { true }
      expect { @airport.takeoff(plane) }.to raise_error "Too stormy to takeoff!"
    end

    it 'raises error when taking off a plane that doesn\'t exist at the airport' do
      expect { @airport.takeoff(plane2) }.to raise_error "Plane doesn't exit at this airport!"
    end
  end
end
