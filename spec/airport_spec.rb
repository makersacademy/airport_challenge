require 'airport'

describe Airport do

  describe '#random_generator' do

    it { expect(subject.random_generator).to be_between(1, 5) }

  end

  describe '#take_off' do

    it 'plane takes off from airport' do
      plane = double :plane
      allow(subject).to receive(:check_storm?).and_return(false)
      subject.take_off(plane)
      expect(subject.planes).to eq []
    end

    it 'raises error when trying to take off in stormy weather' do
      plane = double :plane
      allow(subject).to receive(:check_storm?).and_return(true)
      expect { subject.take_off(plane) }.to raise_error 'Cannot take off in storm'
    end

  end

  describe '#land' do

    it 'lands plane at airport in good weather' do
      plane = double :plane
      allow(subject).to receive(:check_storm?).and_return(false)
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end

    it 'raises error when trying to land in stormy weather' do
      plane = double :plane
      allow(subject).to receive(:check_storm?).and_return(true)
      expect { subject.land(plane) }.to raise_error 'Cannot land in storm'
    end

  end

end
