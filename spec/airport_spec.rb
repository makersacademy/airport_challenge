require 'airport'
require 'plane'

describe Airport do
  let(:plane) { instance_double('Plane')}
  let(:weather) { instance_double('Weather') }

  context 'When the weather is sunny' do
    let(:subject) { described_class.new(weather) }

    it 'allows the plane to land' do
      allow(weather).to receive(:todays_weather).and_return('sunny')
      subject.land(plane)
      expect(subject.hanger).to include(plane)
    end

    it 'confirms the weather is sunny' do
      allow(weather).to receive(:todays_weather).and_return('sunny')
      expect(subject.weather_at_airport).to eq 'sunny'
    end

    it 'can instruct an airplane to take off' do
      allow(weather).to receive(:todays_weather).and_return('sunny')
      expect(subject).to respond_to(:takeoff)
    end

    it 'confirms that plane that took off is no longer in hanger' do
      allow(weather).to receive(:todays_weather).and_return('sunny')
      subject.land(plane)
      taken_off_plane = subject.takeoff
      expect(subject.hanger).to_not include(taken_off_plane)
    end
  end
end
