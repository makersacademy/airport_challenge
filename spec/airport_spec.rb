require 'airport'

describe Airport do

  let(:plane) { double('plane') }

  describe '#land' do

    it 'lands a plane' do
      subject.land(plane)
      expect(subject.plane).to eq(plane)
    end

    it 'refuses to land a plane if airport full' do
      subject.land(plane)
      expect { subject.land(plane) }
          .to raise_error 'Landing not possible, airport full.'
    end

    it 'refuses to land a plane if weather is stormy' do
      allow(subject).to receive(:stormy?) { true }
      expect { subject.land(plane) }
          .to raise_error 'Landing not possible, too stormy.'
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
