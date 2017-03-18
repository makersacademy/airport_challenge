require 'plane'
describe Plane do
  describe '#landed?' do
    it 'has a method that checks if it has landed' do
      expect(subject).to respond_to(:landed?)
    end

    it 'reports as not landed before being landed by Airport' do
      expect(subject).not_to be_landed
    end
  end

  describe '#land_plane' do
    it 'has a method to mark plane as landed' do
      expect(subject).to respond_to(:land_plane)
    end

    it 'marks plane as landed' do
      subject.land_plane
      expect(subject).to be_landed
    end
  end

  describe '#take_off_plane' do
    it 'has a method to mark plane as not landed' do
      expect(subject).to respond_to(:take_off_plane)
    end

    it 'marks plane as not landed' do
      subject.take_off_plane
      expect(subject).not_to be_landed
    end
  end

end
