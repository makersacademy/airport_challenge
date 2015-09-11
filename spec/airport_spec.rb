require 'airport'

describe Airport do

  let(:plane){ double :plane }

  describe 'take off' do
    it { is_expected.to respond_to :take_off }
  end

  describe 'landing' do
    it { is_expected.to respond_to :land }

    it { is_expected.to respond_to(:land).with(1).argument }
  end

  describe 'traffic control' do
    context 'when airport is full' do
      it 'does not allow plane to land' do
        subject.capacity.times { subject.land(plane) }
        expect{ subject.land(plane) }.to raise_error 'Airport full.'
      end

      it 'does not allow plane to take off' do
        subject.land(plane)
        subject.take_off
        expect{ subject.take_off }.to raise_error 'No planes at airport'
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
      it 'does not allow plane to take off' do
        expect(subject).to receive(:weather).and_return(:stormy)
        subject.weather
        expect{subject.take_off_bad_weather}.to raise_error 'Stormy weather'
      end

      it 'does not allow plane to land' do
        expect(subject).to receive(:weather).and_return(:stormy)
        subject.weather
        expect{subject.land_bad_weather}.to raise_error 'Stormy weather'
      end
      it 'makes the weather stormy' do
        subject.weather
        expect(subject.weather).to eq(:stormy).or eq(:sunny)
      end
    end
  end
    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
end
