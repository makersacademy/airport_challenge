require "plane.rb"

describe Plane do

  describe '#land' do
    it 'can instruct a plan to land' do
      expect(subject).to respond_to(:land).with(1).arguments
    end
  end

  describe '#landed?' do
    it 'confirms that it is landed' do
      subject.land(double(:airport))
      expect(subject.landed?).to be(true)
    end
  end
end
