require 'airport'

describe Airport do
  it 'should create an aiport object'
  describe '#land' do
    it 'should land the plane at the airport' do
      expect(subject.land).to eq('Plane has landed safely!')
    end
  end
  describe '#takeOff' do
    it 'should let user know that the plane has taken off' do
      expect(subject.takeOff).to eq('Plane has taken off safely!')
    end
  end
end
