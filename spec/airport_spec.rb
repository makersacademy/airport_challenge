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

  let(:plane) { double(:plane, landing: nil, taking_off: nil) }
  before(:each) do
    allow(subject).to receive(:weather) { "sunny" }
  end

  describe 'take off' do

    it 'instructs a plane to take off' do
      expect(subject).to respond_to(:take_off)
    end

    it 'releases a plane' do
      subject.land plane
      count = subject.planes.count
      subject.take_off
      expect(subject.planes.count).to eq(count - 1)
    end

    it "doesn't release a plane if there are none" do
      expect { subject.take_off }.to raise_error "No planes here at the mo."
    end

  end

  describe 'landing' do

    it "checks plane isn't already landed" do

    end

    it 'instructs a plane to land' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'receives a plane' do
      count = subject.planes.count
      subject.land plane
      expect(subject.planes.count).to eq(count + 1)
    end

  end

  describe 'traffic control' do

    it "has a capacity" do
      expect(subject).to respond_to(:capacity)
    end

    context 'when airport is full' do
      it 'does not allow a plane to land' do
        subject.capacity.times { subject.land plane }
        expect { subject.land plane }.to raise_error "Sorry, we're full!"
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
        subject.land plane
        allow(subject).to receive(:weather) { "stormy" }
        expect { subject.take_off }.to raise_error "Nope, too dangerous to fly right now!"
      end

      it 'does not allow a plane to land' do
        allow(subject).to receive(:weather){"stormy"}
        expect { subject.land plane }.to raise_error "Nope, too dangerous to guide you in at the mo. Circle!"
      end

    end

  end

end
