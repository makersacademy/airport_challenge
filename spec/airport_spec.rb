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

  it { is_expected.to respond_to :plane_take_off}



  describe 'plane take off' do

    before :each do
      allow(subject).to receive(:stormy?) { false }
    end


    it 'instructs a plane to take off' do
      plane = double :plane, land: 'smth'
      subject.plane_landing(plane)
      expect(plane).to receive(:take_off)
      subject.plane_take_off
    end

    it 'releases something' do
      plane = double :plane, land: 'smth', take_off: 'smth'
      subject.plane_landing(plane)
      planes_in_airport = subject.hangar.length
      subject.plane_take_off
      expect(subject.hangar.length).to eq(planes_in_airport-1)
    end

    it 'releases a plane' do
      plane = double :plane, land: 'smth', take_off: 'smth'
      subject.plane_landing(plane)
      expect(subject.plane_take_off).to be plane
    end

    it 'releases a plane when the airport is full' do
      plane = double :plane, land: 'smth', take_off: 'smth'
      subject.capacity.times { subject.plane_landing plane}
      planes_in_airport = subject.hangar.length
      subject.plane_take_off
      expect(subject.hangar.length).to eq(planes_in_airport-1)
    end
  end

  it { is_expected.to respond_to(:plane_landing).with(1).argument}

  describe 'plane_landing' do

    before :each do
      allow(subject).to receive(:stormy?) { false }
    end

    it 'instructs a plane to land' do
      plane = double :plane
      expect(plane).to receive(:land)
      subject.plane_landing(plane)
    end

    it 'receives a plane' do
      plane = double :plane, land: 'smth'
      subject.plane_landing(plane)
      expect(subject.hangar).to include(plane)
    end

    it 'raises a error when airport is full' do
      plane = double :plane,land:'smth'
      subject.capacity.times { subject.plane_landing plane}
      expect {subject.plane_landing plane}.to raise_error("Airport is full")
    end

  end

  it { is_expected.to respond_to :stormy?}

  describe 'weather_stormy?', skip_before: true do
    it 'there is 20% possibility of storm', skip_before: true do
      srand(1)
      rand
      rand
      expect(subject.stormy?).to be true
    end
  end

  it { is_expected.to respond_to :traffic_control}

  describe 'traffic control' do

    # Include a weather condition.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy,
    # the plane can not take off and must remain in the airport.
    #
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport

    context 'when weather conditions are stormy' do
      it 'does not allow a plane to land' do
        allow(subject).to receive(:stormy?) { true }
        expect{subject.traffic_control}.to raise_error("The weather is stormy!")
      end
    end
  end
end
