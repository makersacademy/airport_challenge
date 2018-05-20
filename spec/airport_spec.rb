require 'airport'
require 'plane'

describe Airport do
  let(:plane) { instance_double('Plane')}
  let(:weather) { instance_double('Weather') }
  let(:subject) { described_class.new(weather) }

  context 'When space is available at the airport' do
    context 'When the weather is sunny' do
      before do
        allow(weather).to receive(:todays_weather).and_return('sunny')
      end
      it 'allows the plane to land' do
        subject.land(plane)
        expect(subject.hanger).to include(plane)
      end

      it 'confirms the weather is sunny' do
        expect(subject.weather_at_airport).to eq 'sunny'
      end

      it 'can instruct an airplane to take off' do
        expect(subject).to respond_to(:takeoff)
      end

      it 'confirms that plane that took off is no longer in hanger' do
        subject.land(plane)
        taken_off_plane = subject.takeoff
        expect(subject.hanger).to_not include(taken_off_plane)
      end
    end

    context 'When weather is stormy' do
      before do
        allow(weather).to receive(:todays_weather).and_return('stormy')
      end

      it 'does not allow a plane to land' do
        subject.land(plane)
        expect(subject.hanger).to_not include(plane)
      end

      it 'reports that plane is unable to land because of the weather' do
        expect(subject.land(plane)).to eq 'You cannot land due to the weather'
      end

      it 'does not allow a plane to take off' do
        subject.hanger << plane
        subject.takeoff
        expect(subject.hanger).to include(plane)
      end

      it 'reports that plane is unable to takeoff because of the weather' do
        expect(subject.takeoff).to eq 'You cannot takeoff due to the weather'
      end
    end
  end

  context 'When airport hanger is full' do
    it 'does not allow a plane to land' do
      allow(weather).to receive(:todays_weather).and_return('sunny')
      Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
      expect(subject.land(plane)).to eq('Airport is full')
    end
  end
end
