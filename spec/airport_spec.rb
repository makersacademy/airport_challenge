require 'airport'

describe Airport do

  let(:plane) { double('plane') }

  describe '#land' do

    it 'lands a plane' do
      subject.land(plane)
      expect(subject.plane).to eq(plane)
    end

  end

  describe '#take_off' do

    it '#take_off returns a previously landed plane' do
      subject.land(plane)
      expect(subject.take_off).to eq(plane)
    end

  end

end
