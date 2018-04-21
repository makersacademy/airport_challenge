require 'airport.rb'

describe Airport do
  let(:plane1) { double 'Plane1', land: true, take_off: true }
  let(:plane2) { double 'Plane2', land: true, take_off: true }
  let(:stormy_weather) { double 'Weather Station (stormy)', is_stormy: true }

  context '#instructing planes to land' do
    it 'lands one plane' do
      subject.land(plane1)
      expect(subject.hangar.first).to eq plane1
    end

    it 'raises error when landing a plane that is already landed' do
      subject.land(plane1)
      expect { subject.land(plane1) }.to raise_error 'Plane already in airport'
    end
  end

  context '#instructing planes to take off' do
    it 'raises error when no planes in airport' do
      expect { subject.take_off plane1 }.to raise_error 'No planes in airport'
    end

    it 'raises error when requested plane not available' do
      subject.land(plane1)
      expect { subject.take_off plane2 }.to raise_error 'Plane not in airport'
    end

    it 'returns plane when available' do
      subject.land(plane1)
      subject.land(plane2)
      expect(subject.take_off plane1).to eq plane1
      expect(subject.take_off plane2).to eq plane2
    end
  end

  context '#confirming if a particular plane has left' do
    it 'returns true if plane not in airport' do
      expect(subject.confirm_left_airport plane1).to be_truthy
    end
  end

  context '#prevents plane taking off in stormy weather' do
    it 'raies error when weather is stormy' do
      subject.land(plane1)
      expect { subject.take_off(plane1, stormy_weather.is_stormy) }.to raise_error 'Cannot take off in stormy weather'
    end
  end

end
