require "airport"

describe Airport do

  describe '#take_off' do
    plane = Plane.new
    it 'Checks whether plane has taken off and left airport' do
      expect(subject.take_off(plane)).to eq true
    end
  end

  describe '#inventory' do
    it 'Shows the landed plane at the airport' do
      @plane = Plane.new
      @plane2 = Plane.new
      subject.inventory(@plane)
      subject.inventory(@plane2)
      expect(subject.planes.push).to include(@plane, @plane2)
    end
  end

end
