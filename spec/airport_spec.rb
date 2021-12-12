require 'airport'
require 'plane'
#Describe Airport class and land method
context Airport do
  describe '#land' do
    it 'should land a plane' do
      plane = Plane.new
      #subject = Airport
      expect(subject.land(plane)).to eq(plane)
    end
  end
end