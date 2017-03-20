require 'plane'
describe Plane do
  describe '#landed' do

    it 'should report as not landed before being landed by Airport' do
      expect(subject).not_to be true
    end
  end

  describe '#land_plane' do

    it 'should mark plane as landed' do
      subject.land_plane
      expect(subject.landed).to be true
    end
  end

  describe '#take_off_plane' do

    it 'should mark plane as not landed' do
      subject.take_off_plane
      expect(subject.landed).not_to be true
    end
  end

end
