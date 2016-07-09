require 'plane'

describe Plane do

  describe '#land' do
    it 'can be landed' do
      subject.land
      expect(subject).to be_landed
    end
    it 'cannot be landed if it is already landed' do
      allow(subject).to receive(:landed?).and_return(true)
      expect{ subject.land }.to raise_error 'Plane already landed'
    end
  end

  describe '#take_off' do
    it 'can take off from the airport' do
      subject.land
      subject.take_off
      expect(subject).to_not be_landed
    end
    it 'cannot take off if it is already in the air' do
      allow(subject).to receive(:landed?).and_return(false)
      expect{ subject.take_off }.to raise_error 'Plane already in air'
    end
  end

end
