require 'airport'
require 'plane'

describe Airport do
  describe '#land' do
    it { is_expected.to respond_to(:land) }
  end

  describe '#land plane' do 
    it 'lands the plane' do
      subject.land(Plane.new)
      expect { subject.land(Plane.new) }.to change { subject.planes.length }.by(1)
    end
  end

  describe 'airport at full capacity' do
    it 'raises error if airport is at full capacity' do 
      5.times {subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error "Airport at full capacity"
    end
  end

  describe '#depart' do 
    it 'checks if plane has left airport' do 
      subject.land(Plane.new)
      expect { subject.planes.pop }.to change { subject.planes.length }.by(-1)
    end
  end
end

describe Plane do
end