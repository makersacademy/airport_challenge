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
  let(:plane) {Plane.new}

  describe 'approve_take_off' do

    before(:each) do
      expect(subject).to receive(:weather).and_return(:sunny)
      subject.approve_landing plane
    end

    it 'instructs a plane to take off' do
      #subject.approve_landing plane
      expect(subject).to receive(:weather).and_return(:sunny)
      expect(subject.approve_take_off plane).to eq plane.flying
    end

    it 'releases a plane' do
      expect(subject).to receive(:weather).and_return(:sunny)
      subject.approve_take_off plane
      expect(subject).to be_empty
    end
  end

  describe 'approve_landing' do
    before(:each) {expect(subject).to receive(:weather).and_return(:sunny)}

    it 'instructs a plane to land' do

      expect(subject.approve_landing plane).to eq plane.land
    end

    it 'recieves a plane' do
      subject.approve_landing plane
      expect(subject).not_to be_empty
    end

  end

  describe 'traffic control' do

    context 'when airport is full' do
      before (:each) {expect(subject).to receive(:full?).and_return(true)}

      it 'does not allow a plane to land' do
        expect { subject.approve_landing plane }.to raise_error 'Airport is full'
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
        expect(subject).to receive(:weather).and_return(:sunny)
        subject.approve_landing plane
        expect(subject).to receive(:weather).and_return(:stormy)
        expect {subject.approve_take_off plane }.to raise_error "Airport has stormy weather"
      end


      it 'does not allow a plane to land' do
        expect(subject).to receive(:weather).and_return(:stormy)
        expect {subject.approve_landing plane }.to raise_error "Airport has stormy weather"

      end
    end

    context 'when weather conditions are sunny' do
      before (:each) {expect(subject).to receive(:weather).and_return(:sunny)}

      it 'allows a plane to land' do
        subject.approve_landing plane
      end

      it 'allows planes to take off' do
        subject.approve_landing plane
        expect(subject).to receive(:weather).and_return(:sunny)
        subject.approve_take_off plane
      end
    end
  end
end
