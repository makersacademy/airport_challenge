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
  describe '#take_off' do
    it 'should let user know that the plane ha taken off' do
      expect(subject.take_off(plane)).to eq('Plane has taken off safely!')
    end
  end
  describe '#stormy?' do
    let (:weather) {double :weather}
    it 'should create weather object and return false when not stormy' do
      expect(subject.stormy?).to eq(false)
    end
    # let (:weather) {double Weather(true).new}
    # it 'should create weather object and return true when stormy' do
    #   expect(subject.stormy?).to eq(true)
    # end
  end
end
