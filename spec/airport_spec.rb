require 'airport'
require 'plane'

describe Airport do

  describe '#land' do
    @airport = Airport.new(20)
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'doesnt allow landing when full' do
      plane = :plane
      airport = Airport.new(20)
      20.times do
        airport.land(plane)
      end
        expect { airport.land(plane) }.to raise_error 'When full'
    end

    it 'doesnt allow to land when stormy' do
      plane = Plane.new
      airport = Airport.new
    end
  end

  describe '#tak_off' do
    it 'plane takes off' do
      @airport = Airport.new(20)
      expect(subject).to respond_to(:take_off).with(1).argument
    end
  end
end



    # it 'Doesn't allow planes to land or takeoff in stormy weather' do
    # end
