require 'airport'
require 'plane'

describe Airport do
    @airport = Airport.new
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'plane takes off' do
      @airport = Airport.new
      expect(subject).to respond_to(:take_off).with(1).argument
    end
end

    # it 'airport full and raises an error' do
    #   @airport = Airport.new
    #   planes = Plane.new
    #   expect(subject.land(planes).to raise_error('Airport is full'
    # end

    # it 'Doesn't allow planes to land or takeoff in stormy weather' do
    # end
