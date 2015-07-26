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
let (:flying_plane) {double(:flying_plane, {:landed => false})}
let (:landed_plane) {double(:landed_plane, {:landed => true})}

  it 'has a plane' do
    expect(subject.planes).not_to be_empty
  end

  describe 'take off' do
    it 'instructs a plane to take off' do
      subject.weather = 'sunny'
      subject.take_off_order
      expect(subject).to respond_to(:take_off_order)
    end

    it 'releases a plane' do
      expect(subject).to respond_to(:release)
    end
  end

  describe 'landing' do
    it 'instructs a plane to land' do
      subject.weather = 'sunny'
      subject.landing_order(flying_plane)
      expect(subject.planes).to include flying_plane
    end

    it 'receives a plane' do
      subject.weather = 'sunny'
      expect(flying_plane).to receive(:landed=).with(true)
      subject.landing_order(flying_plane)
      subject.receive(flying_plane)
    end

    it 'fails to receive a plane without instruction' do
      expect{subject.receive flying_plane}.to raise_error "Plane not instructed to land"
    end
  end

  describe 'traffic control' do
    context 'when airport is full' do

      it 'responds to full' do
        expect(subject).to respond_to :full?
      end

      it 'does not allow a plane to land' do
        subject.weather = 'sunny'
        expect {subject.capacity.times {subject.landing_order(flying_plane)}}.to raise_error "Airport is full"
      end
    end

    context 'when weather conditions are stormy' do
      it 'responds to weather' do
        expect(subject).to respond_to :weather
      end

      it 'does not allow a plane to take off' do
        subject.weather = 'stormy'
        expect{subject.take_off_order}.to raise_error "Bad Weather - cannot take off for now"
      end

      it 'does not allow a plane to land' do
        subject.weather = 'stormy'
        expect{subject.landing_order(flying_plane)}.to raise_error "Bad Weather - cannot land for now"
      end
    end
  end
end
