require 'airport'

describe Airport do

  let(:plane) { Plane.new }

  describe '#initialize' do
    it 'prevents landing when the airport is full' do
      described_class::DEFAULT_CAPACITY.times {subject.land(plane)}
      expect { subject.land(plane) }.to raise_error 'Airport is full'
    end
  end

  describe '#land' do
    it 'responds to land' do
      expect(subject).to respond_to(:land)
    end

    it 'lands a plane at an airport' do
      subject.land(plane)
      expect(subject.planes).to include(plane)
    end
  end

  describe '#take_off' do
    it 'responds to take_off' do
      expect(subject).to respond_to(:take_off)
    end

    it 'takes off from the airport and is no longer there' do
      allow(subject).to receive(:stormy?) { false }
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).not_to include(plane)
    end

    it 'only takes off planes from an airport they are in' do
      expect { subject.take_off(plane) }.to raise_error 'Plane is not at airport'
    end
  end

  # context 'when the weather is stormy' do
  #   before { allow(subject).to receive(:stormy?) { true } }
  #   it 'prevents take off when weather is stormy' do
  #     subject.land(plane)
  #     expect { subject.take_off(plane) }.to raise_error 'Cannot take off, weather is stormy'
  #   end
  # end
end
