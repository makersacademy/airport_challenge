require 'airport'

class PlaneDouble

end

describe Airport do

  describe '#land' do
    it { should respond_to(:land).with(1).argument }

    it 'stores the plane that landed' do
      plane = PlaneDouble.new
      subject.land(plane)
      expect(subject.has_plane?(plane)).to eq true
    end
  end

  describe '#takeoff' do
    it { should respond_to(:takeoff).with(1).argument }

    it 'removes the plan that took off' do
      plane = PlaneDouble.new
      subject.land(plane)
      subject.takeoff(plane)
      expect(subject.has_plane?(plane)).to eq false
    end

    it 'prevents plane from taking off from an airport it is not at' do
      plane = PlaneDouble.new
      heathrow = Airport.new
      gatwick = Airport.new

      heathrow.land(plane)
      expect { gatwick.takeoff(plane) }.to raise_error("Plane is not at #{gatwick.name}")

    end
  end
end
