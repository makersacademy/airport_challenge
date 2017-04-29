require 'plane'

describe Plane do

  describe '#land' do

    before { subject.land }
    it 'can be landed' do
      expect(subject).to be_landed
    end
    it 'cannot be landed if it is already landed' do
      expect{ subject.land }.to raise_error 'Plane already landed'
    end
  end

  describe '#take_off' do

    before do
      subject.land
      subject.take_off
    end
    it 'can take off from the airport' do
      expect(subject).to_not be_landed
    end
    it 'cannot take off if it is already in the air' do
      expect{ subject.take_off }.to raise_error 'Plane already in air'
    end
  end

end
