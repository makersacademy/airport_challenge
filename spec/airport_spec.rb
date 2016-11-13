require 'airport'


describe Airport do
  subject(:airport) { described_class.new }

  context 'Take off and landing features' do
    it 'should confirm a plane has landed' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.landed_planes).to include plane
    end

    it 'should confirm a plane has taken off' do
      plane = Plane.new
      subject.land(plane)
      subject.take_off
      expect(subject.airborne_planes).to include plane
    end
  end

end
