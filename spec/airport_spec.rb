require 'airport'

## Note these are just some guidelines!
## Feel free to write more tests!!

# A plane currently in the airport can be requested to take off.
#
# No more planes can be added to the airport, if it's full.
# It is up to you how many planes can land in the airport
# and how that is implemented.
#
# If the airport is full then no planes can land

describe Airport do

  it "has a weather state" do
    expect(subject).to respond_to(:weather)
  end

  describe 'take off' do
    it 'instructs a plane to take off' do
      expect(subject).to respond_to(:take_off).with(1).argument
    end


    it 'releases a plane' do
      plane = double :plane, landing: nil, taking_off: nil
      allow(subject).to receive(:weather){"sunny"}
      subject.land plane
      count = subject.planes.count
      subject.take_off plane
      expect(subject.planes.count).to eq(count - 1)
    end
  end

  describe 'landing' do
    it 'instructs a plane to land' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'receives a plane' do
      plane = double :plane, landing: nil
      allow(subject).to receive(:weather){"sunny"}
      count = subject.planes.count
      subject.land plane
      expect(subject.planes.count).to eq(count + 1)
    end
  end

  describe 'traffic control' do

    it "has a capacity of 20" do
      expect(Airport::DEFAULT_CAPACITY).to eq 20
    end

    context 'when airport is full' do
      it 'does not allow a plane to land' do
        plane = double :plane, landing: nil
        allow(subject).to receive(:weather){"sunny"}
        20.times {subject.land plane}
        expect{subject.land plane}.to raise_error "Sorry, we're full!"
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

    context 'when weather conditions are stormy' do
      it 'does not allow a plane to take off' do
        plane = double :plane, landing: nil, taking_off: nil
        allow(subject).to receive(:weather){"stormy"}
        expect{subject.take_off plane}.to raise_error "Nope, too dangerous to fly right now!"
      end

      it 'does not allow a plane to land' do
        plane = double :plane, landing: nil, taking_off: nil
        allow(subject).to receive(:weather){"stormy"}
        expect{subject.land plane}.to raise_error "Nope, too dangerous to guide you in at the mo. Circle!"
      end
    end
  end
end
