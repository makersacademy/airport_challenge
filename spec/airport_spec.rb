require 'airport'
require 'plane'

describe Airport do

  subject {Airport.new}
  let(:plane) {Plane.new}

  describe 'take off' do
    it {is_expected.to respond_to(:take_off).with(1).argument} 
  end

  describe 'landing' do
    it {is_expected.to respond_to(:land).with(1).argument}
  end

  describe 'traffic control' do
    it 'does not allow a plane to land & raises an error' do
      50.times {subject.land(plane)}
      expect {subject.land(plane)}.to raise_error 'Unable to land plane, airport at capacity'
    end

    it 'does not allow a plane to take off if airport is empty' do
      subject.empty?
      expect {subject.take_off(plane)}.to raise_error 'Airport is empty'
    end
  end

    # Include a weather condition.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy,
    # the plane can not take off and must remain in the airport.
    #
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport

  #   context 'when weather conditions are stormy' do
  #     xit 'does not allow a plane to take off'

  #     xit 'does not allow a plane to land'
  #   end
  # end
end
