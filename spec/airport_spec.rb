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
      
    end

  end

  describe '#take_off' do

    it 'returns a previously landed plane' do
      subject.land(plane)
      expect(subject.take_off).to eq(plane)
    end

  end

end
