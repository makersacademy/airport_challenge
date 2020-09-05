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
  end
end