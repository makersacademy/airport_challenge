require 'plane'
describe Plane do
  describe '#landed' do

    it 'should report as airborne before being landed by Airport' do
      expect(subject.airborne).to be true
    end
  end

  describe '#land_plane' do

    it 'should mark plane as not airborne' do
      subject.land_plane
      expect(subject.airborne).to be false
    end
  end

  describe '#take_off_plane' do

    it 'should mark plane as airborne' do
      subject.take_off_plane
      expect(subject.airborne).to be true
    end
  end

end
