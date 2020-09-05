require 'airport'

class PlaneDouble

end

describe Airport do

  describe '#land' do
    it { should respond_to(:clear_landing).with(1).argument }

    it 'stores the plane that landed' do
      plane = PlaneDouble.new
      subject.clear_landing(plane)
      expect(subject.has_plane?(plane)).to eq true
    end
  end

  describe '#clear_takeoff' do
    it { should respond_to(:clear_takeoff).with(1).argument }

    it 'removes the plan that has taken off' do
      plane = PlaneDouble.new
      subject.clear_landing(plane)
      subject.clear_takeoff(plane)
      expect(subject.has_plane?(plane)).to eq false
    end

    it 'prevents plane from taking off from an airport it is not at' do
      plane = PlaneDouble.new
      heathrow = Airport.new
      expect { heathrow.clear_takeoff(plane) }.to raise_error("Plane is not at this airport")
    end
  end
end
