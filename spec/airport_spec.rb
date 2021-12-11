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
      Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error "Airport at full capacity"
    end

    it 'raises an error if airport is at full capacity & capacity is overridden' do
      num = 9
      air = Airport.new(num)
      num.times { air.land(Plane.new) }
      expect {air.land(Plane.new) }.to raise_error "Airport at full capacity"
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