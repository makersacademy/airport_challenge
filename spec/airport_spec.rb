require 'airport'

describe Airport do
  let(:plane) { double(:airplane) }

  describe ' #call_takeoff' do
    before(:each) do
      allow(plane).to receive("land")
      subject.call_landing(plane)
      allow(plane).to receive("takeoff")
    end

    it 'instructs a plane to take off' do
      expect(subject).to respond_to(:call_takeoff)
    end

    it 'releases a plane' do
      expect(subject.call_takeoff).to eq(plane)
    end
  end

  describe ' #call_landing' do
    before(:each) do
      allow(plane).to receive(:land)
    end

    it 'instructs a plane to land' do
      expect(subject).to respond_to(:call_landing).with(1).argument
    end

    it 'receives a plane' do
      expect(subject.call_landing plane).to eq(plane)
    end
  end
#
#  describe 'traffic control' do
#    context 'when airport is full' do
#      xit 'does not allow a plane to land'
#    end

    # Include a weather condition.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy,
    # the plane can not take off and must remain in the airport.
    #
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport

#    context 'when weather conditions are stormy' do
#      xit 'does not allow a plane to take off'
#
#      xit 'does not allow a plane to land'
#    end
#  end
end
