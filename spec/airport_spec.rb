require 'airport'

describe Airport do

  subject { Airport.new }
  let(:plane) { Plane.new }

  context 'when weather is normal' do
    before do
      allow_any_instance_of(Weather).to receive(:stormy?).and_return false
    end

    describe '#land' do
      it { is_expected.to respond_to(:land).with(1).argument }
  
      it 'instructs a plane to land at an airport' do
        expect(subject.land(plane)).to eq [plane]
      end

      it 'allows a plane to land when weather is not stormy' do
        expect { subject.land(plane) }.not_to raise_error
      end
  
      it 'raises an error to prevent landing when the airport is full' do
        Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
        error = "Landing is not permmited- the airport is full"
        expect { subject.land(plane) }.to raise_error error
      end
    end
  
    describe '#take_off' do
      it { is_expected.to respond_to(:take_off).with(1).argument }
  
      it 'instructs the plane to take off' do
        subject.land(plane)
        subject.take_off(plane)
        expect(subject.planes).not_to include plane
      end

      it 'allows a plane to take off when weather is not stormy' do
        expect { subject.take_off(plane) }.not_to raise_error
      end
    end
  end

  context 'when weather is stormy' do
    before do
      allow_any_instance_of(Weather).to receive(:stormy?).and_return true
    end

    it 'prevents landing' do
      error = "Landing is not permmited- stormy weather!"
      expect { subject.land(plane) }.to raise_error error
    end

    it 'prevents takeoff' do
      error = "Take off is not permmited- stormy weather!"
      expect { subject.take_off(plane) }.to raise_error error
    end
  end

end
