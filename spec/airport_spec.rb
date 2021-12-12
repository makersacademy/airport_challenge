require 'airport'
require 'plane'
#Describe Airport class land method
context Airport do
  #subject = Airport
  #land method
  describe '#land' do
    it 'should land a plane' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.planes).to include(plane)
    end
  end
  #take_off method
  describe '#take_off' do
  it 'should take of a plane' do
    plane = Plane.new
    subject.take_off(plane)
    expect(subject.planes).not_to include(plane)
  end
end

end