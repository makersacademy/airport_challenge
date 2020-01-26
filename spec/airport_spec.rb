require 'airport'

describe Airport do
  plane = Plane.new
  context '#land(Plane)' do
    it 'runs' do
      expect(subject.land(Plane)).to be
    end
  end
  context '#takeoff(Plane)' do
    it 'advises plane has left' do
      expect(subject.takeoff(Plane)).to eq("Plane has left")
    end
  end
end