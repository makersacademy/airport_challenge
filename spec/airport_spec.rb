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
let(:plane){double :plane, land: nil, take_off: nil}

  before do
    allow(subject).to receive(:rand_num) {0}
  end

  # it 'has capacity' do
  #   expect(subject.capacity).to eq Airport::CAPACITY
  # end

  it 'responds to forecast' do
    expect(subject).to respond_to(:forecast)
  end

  describe 'forecast' do
    # it 'has random number generator for forecast' do
    #srand()
    #end

    it 'can be stormy' do
      allow(subject).to receive(:rand_num) {1}
      expect(subject.forecast).to eq "stormy"
    end

    it 'can be sunny' do
      expect(subject.forecast).to eq "sunny"
    end
  end

  describe 'allow_take_off' do
    it 'gives permission for plane to take off' do
      expect(subject).to respond_to(:allow_take_off)
    end

    it 'cannot release plane if empty' do
      expect {subject.allow_take_off}.to raise_error "No planes at the airport"
    end

    it 'releases plane' do
      subject.allow_land plane
      plane_count = subject.planes.count
      subject.allow_take_off
      expect(subject.planes.count).to eq (plane_count - 1)
    end
  end

  describe 'allow_landing' do
    it 'give permission for a plane to land' do
      expect(subject).to respond_to(:allow_land).with(1).argument
    end

    it 'receives a plane' do
      plane_count = subject.planes.count
      subject.allow_land plane
      expect(subject.planes.count).to eq (plane_count + 1)
    end
  end


  describe 'air traffic control' do
    context 'when airport is full' do
      it 'plane cannot land' do
        20.times {subject.allow_land plane}
        expect {subject.allow_land plane}.to raise_error "Airport is full pilot"
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

      it 'plane cannot take off' do
        subject.allow_land plane
        allow(subject).to receive(:rand_num) {1}
        expect {subject.allow_take_off}.to raise_error "Sorry, bad weather"
      end

      it 'plane cannot land' do
        allow(subject).to receive(:rand_num) {1}
        expect {subject.allow_land plane}.to raise_error "Sorry, bad weather"
      end
    end
  end
end
