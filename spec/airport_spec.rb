require 'airport'

describe Airport do
  it 'should create an aiport object'
  let (:plane) { double :plane }
  describe '#land' do
    it 'should land the plane at the airport' do
      expect(subject.land(plane)).to eq('Plane has landed safely!')
    end
    it 'should raise an error message when the airport is full' do
      5.times { subject.land plane }
      expect{ subject.land plane }.to raise_error("WARNING airport is full, no space to land")
    end
  end
  describe '#takeOff' do
    it 'should let user know that the plane has taken off' do
      expect(subject.takeOff(plane)).to eq('Plane has taken off safely!')
    end
  end
end
