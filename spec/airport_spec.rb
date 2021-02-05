require 'airport'
require 'plane'
require 'weather'

describe Airport do

  let(:airport) { Airport.new }
  let(:plane) { double :plane } # using a double here because I created a separate class
  let(:weather) { double :weather }

  describe '#can_land_a_plane' do
    it 'lands a plane at an airport, registers it' do
      allow(weather).to receive(:stormy?).and_return 'false'
      airport.airport_full?
      airport.can_land(plane)
      expect(airport.all_planes).to include plane
    end
    it 'cannot land a plane if the weather is stormy' do
      #airport.can_land(plane) # here i am not sure if I need to use the can_land nethod before I check the weather on newxt line
      allow(weather).to receive(:stormy?).and_return 'true'
      expect { airport.can_land(plane) }.to raise_error "cannot land at the moment due to stormy weather"
    end
  end

  describe '#can_take_off' do
    it 'plane can take off and will be removed from the airport capacity' do
      airport.can_land(plane)
      allow(weather).to receive(:stormy?).and_return 'false'
      airport.can_take_off(plane)
      expect(airport.all_planes).not_to include plane
    end
  end

  describe '#airport_full?' do
    it 'does not land planes when the airport is full' do
      Airport::DEFAULT_CAPACITY.times { airport.can_land(plane) }
      expect { airport.can_land(plane) }.to raise_error "airport is full now, cannot land any planes"
    end
  end

  describe '#initialize' do
    it 'has the capacity that can be overridden when needed' do
      airport.capacity == Airport::DEFAULT_CAPACITY # here I wasn't sure if I need to write 35 or the DEFAULT_CAPACITY const?
      expect(airport.capacity).to eq 35
    end
  end
end