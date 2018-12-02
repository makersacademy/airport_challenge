require 'Airport'

RSpec.describe Airport do
  describe '#land' do
    it 'instructs a plane to land' do
      airport = Airport.new
      plane = double('a plane')

      expect(airport.land(plane)).to eq [plane]
    end
  end

  describe '#takeoff' do
    it 'instructs a plane to takeoff' do
      airport = Airport.new
      plane = double('a plane')
      airport.land(plane)

      expect(airport.takeoff(plane)).to eq plane
    end
  end

  describe 'capacity' do
    it 'can be set when needed' do
      airport = Airport.new(capacity: 2)
      plane = double('a plane')

      expect(airport.land(plane)).to eq [plane]
    end

    it 'can be set when needed' do
      airport = Airport.new(capacity: 1)
      plane = double('a plane')
      airport.land(plane)

      expect { airport.land(plane) }.to raise_error('Airport full')
    end
  end

end
