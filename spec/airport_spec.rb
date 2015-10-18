require 'airport'

describe Airport do

  let(:plane) { double('plane') }

  describe '#land' do

    it 'lands a plane' do
      subject.land(plane)
      expect(subject.planes.last).to eq(plane)
    end

    it 'refuses to land a plane if default capacity reached' do
      Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
      expect { subject.land(plane) }
          .to raise_error 'Landing not possible, airport full.'
    end

    it 'refuses to land a plane if weather is stormy' do
      allow(subject).to receive(:stormy?) { true }
      expect { subject.land(plane) }
          .to raise_error 'Landing not possible, too stormy.'
    end

    it 'allows a custom capacity to be set' do
      subject.set_capacity(50)
      50.times { subject.land(plane) }
      expect { subject.land(plane) }
        .to raise_error 'Landing not possible, airport full.'
    end

  end

  describe '#take_off' do

    it 'takes-off (and returns) a previously landed plane' do
      subject.land(plane)
      expect(subject.take_off).to eq(plane)
    end

    it 'refuses to take-off if weather is stormy' do
      subject.land(plane)
      allow(subject).to receive(:stormy?) { true }
      expect {subject.take_off}
          .to raise_error 'Take-off not possible, too stormy.'
    end

  end

end
