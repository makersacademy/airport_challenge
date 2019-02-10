require 'airport'
require 'plane'

describe Airport do
    @airport = Airport.new(20)
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'plane takes off' do
      @airport = Airport.new(20)
      expect(subject).to respond_to(:take_off).with(1).argument
    end

    it 'doesnt allow landing when full' do
      20.times do
        @airport.land(:planes)
      end
      expect {subject.land(:planes) }.to raise_error 'When full'
      end

    # it 'airport full and raises an error' do
    #   @airport = Airport.new(20)
    #   planes = Plane.new
    #   expect(subject.land(planes).to raise_error('Airport is full')
    # end
end



    # it 'Doesn't allow planes to land or takeoff in stormy weather' do
    # end
