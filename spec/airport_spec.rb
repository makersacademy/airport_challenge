require 'airport'

describe Airport do
  let(:plane) { double('plane') }
  let(:airport) { Airport.new }
  describe '#land' do
    it 'responds to #land' do
      is_expected.to respond_to(:land)
    end
    it 'responds to #land with the arguement "plane"' do
      is_expected.to respond_to(:land).with(1).argument
    end
    it 'lands an airplane and stores it in airport' do
      airport.land(plane)
      expect(airport.landed_planes).to eq [plane]
    end
    it 'confirms plane has landed with message "Plane has landed"' do
      expect(airport.land(plane)).to eq 'Plane has landed'
    end
  end
  describe '#plane_takeoff' do
    it 'responds to #plane_takeoff' do
      is_expected.to respond_to(:plane_takeoff)
    end
    it 'when #plane_takeoff happens, plane leaves airport' do
      airport.land(plane)
      airport.plane_takeoff
      expect(airport.landed_planes).to be_empty
    end
    it 'confirms plane has taken off with message "Plane has taken off"' do
      airport.land(plane)
      expect(airport.plane_takeoff).to eq 'Plane has taken off'
    end
  end
end
