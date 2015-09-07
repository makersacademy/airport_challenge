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

  before do
    allow(subject).to receive(:stormy?).and_return(false)
  end

 let(:plane){double(:plane, land: nil, take_off: nil)}

  describe 'take off' do
    it 'instructs a plane to take off' do
      expect(subject).to respond_to :instruct_to_take_off
    end

    it 'releases a plane' do
      subject.instruct_to_land plane
        num_of_planes = subject.planes.count
      subject.instruct_to_take_off
        expect(subject.planes.count).to eq (num_of_planes - 1)
      end
  end

  describe 'landing' do
    it 'instructs a plane to land' do
       expect(subject).to respond_to(:instruct_to_land).with(1).argument
    end

    it 'receives a plane' do
      num_of_planes = subject.planes.count
      subject.instruct_to_land plane
      expect(subject.planes.count).to eq (num_of_planes + 1)
    end
  end

  describe 'traffic control' do
    context 'when airport is full' do
      it 'does not allow a plane to land' do
        subject.capacity.times
        allow(subject).to receive(:full?).and_return true
        expect {subject.instruct_to_land plane}.to raise_error 'The airport is currently full'
      end
    end

    context 'when airport is empty' do
      it 'does not allow a plane to take off' do
        allow(subject).to receive(:empty?).and_return true
        expect {subject.instruct_to_take_off}.to raise_error 'There are no planes at the airport'
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
        subject.instruct_to_land plane
        allow(subject).to receive(:stormy?).and_return true
        expect {subject.instruct_to_take_off}.to raise_error 'The weather is too stormy to take off'
      end
      it 'does not allow a plane to land' do
        allow(subject).to receive(:stormy?).and_return true
        expect {subject.instruct_to_land plane}.to raise_error 'The weather is too stormy to land'
      end
    end
  end
end
