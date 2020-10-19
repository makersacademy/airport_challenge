system 'clear'
# calling aeroplane file
require 'airport'
require 'plane'
# require 'weather'
# begin - checking airport Class
RSpec.describe Airport do
  let(:airport) { Airport.new(capacity: 10) }
  let(:plane) { Plane.new } # removes the duplication

  describe 'landing and takeoff' do
    it 'a plane can land' do
      expect { airport.receive(plane) }.to change { airport.plane_count }.by(1)
    end

    it 'a plane can takeoff' do
      airport.receive(plane)
      expect { airport.takeoff(plane) }.to change { airport.plane_count }.by(-1)
    end
  end

  describe 'air traffic control' do
    it 'a plane canot land if the airport is full' do
      allow(plane).to receive(:land!).with(airport)
      10.times { airport.receive(plane) }
      expect { airport.receive(plane) }.to raise_error('Full')
    end
  end
end
