require 'airport'

describe Airport do

  let(:plane) {double :plane}

  context 'when instantiated' do
    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  context 'when less than capacity' do
    it 'planes can land' do
      subject.land(plane)
      expect(subject.land(plane)).to eq [plane]
    end

    it 'planes can takeoff' do
      expect(subject.takeoff(plane)).to eq planes.pop
    end
  end

  context 'when weather is bad' do
    it 'planes cannot takeoff' do
      expect(subject.takeoff(plane)).to raise_error 'Delayed: weather is stormy'
    end

    it 'planes cannot land' do
      expect(subject.land(plane)).to raise_error 'Diversion: weather is stormy'
  end

  context 'when at full capacity' do
    it 'planes can takeoff' do
      expect(subject.takeoff(plane)).to eq planes.delete(plane)
    end

    it 'planes cannot land' do
      expect(plane.land).to eq 'Diversion: max capacity reached'
    end
  end
  end
end
