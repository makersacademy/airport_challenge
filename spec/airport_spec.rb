require 'airport'

describe Airport do
  let (:plane) { double :plane }
  describe '#land' do
    it 'should land the plane at the airport if not stormy' do
      expect(subject.land(plane)).to eq('Plane has landed safely!')
    end
    it 'should raise an error message when the airport is full' do
      5.times { subject.land plane }
      expect{ subject.land plane }.to raise_error("WARNING airport is full, no space to land")
    end
    it 'should raise an error message when its stormy' do
      subject.stormy = true
      expect{ subject.land plane }.to raise_error("WARNING stormy weather at airport abort landing")
    end
  end
  describe '#take_off' do
    it 'should let user know that the plane has taken off if not stormy' do
      expect(subject.take_off(plane)).to eq('Plane has taken off safely!')
    end
    it 'should not let the plane take off if it is stormy' do
      subject.stormy = true
      expect{ subject.take_off plane }.to raise_error('WARNING too stormy to take off, abort take off')
    end
  end
end
