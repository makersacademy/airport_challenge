require 'airport'
require 'plane'


describe Airport do
  describe '#land' do
    it 'respond to land method with one argument' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'return plane that landed' do
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end
  end
end