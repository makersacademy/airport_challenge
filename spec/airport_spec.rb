require 'airport'

describe Airport do

  let (:plane) {double('plane', flying?: true, land: false, take_off: true) }

  describe 'take off' do
    it 'instructs a plane to take off' do
      is_expected.to respond_to(:plane_take_off)
    end

    it 'releases a plane' do
      allow(subject).to receive(:stormy?).and_return(false)
      subject.plane_land(plane)
      subject.plane_take_off(plane)
      expect(subject.planes.empty?).to eq(true)
    end

    it 'raises an error when no planes at the airport' do
      expect { subject.plane_take_off(plane) }.to raise_error
      'Cannot currently take off'
    end
  end

  describe 'landing' do
    it 'instructs a plane to land' do
      is_expected.to respond_to(:plane_land).with(1).argument
    end

    it 'receives a plane' do
      allow(subject).to receive(:stormy?).and_return(false)
      subject.plane_land(plane)
      expect(subject.planes.any?).to eq(true)
    end
  end

  describe 'traffic control' do
    context 'when airport is full' do
      it 'does not allow a plane to land' do
        allow(subject).to receive(:stormy?).and_return(false)
        subject.capacity.times { subject.plane_land(plane) }
        expect { subject.plane_land(plane) }.to raise_error
        'Plane cannot currently land at airport'
      end
    end

    context 'when weather conditions are stormy' do

      it 'creates stormy conditions' do
        allow(subject).to receive(:weather_randomiser).and_return(1)
        expect(subject.stormy?).to eq(true)
      end

      it 'does not allow a plane to land' do
        allow(subject).to receive(:stormy?).and_return(:true)
        expect { subject.plane_land(plane) }.to raise_error
        'Plane cannot currently land at airport'
      end

      it 'does not allow a plane to take off' do
        allow(subject).to receive(:stormy?).and_return(false)
        subject.plane_land(plane)
        allow(subject).to receive(:stormy?).and_return(true)
        expect { subject.plane_take_off(plane)}.to raise_error
        'Cannot currently take off'
      end
    end
  end
end
