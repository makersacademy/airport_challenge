require 'airport'
require 'plane'

describe Airport do
  before(:each) do
    @plane = Plane.new
  end

  describe 'initialization' do
    before(:each) do
      allow(subject).to receive(:weather) { "sunny" }
    end

    it 'has a default capacity' do
      Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
      expect{ subject.land(Plane.new) }.to raise_error("Cannot land, airport full")
    end
    it 'has an overridden capacity' do
      random_capacity = rand(100)
      subject { Airport.new(random_capacity) }
      subject.capacity.times { subject.land(Plane.new) }
      expect{ subject.land(Plane.new) }.to raise_error("Cannot land, airport full")
    end
  end

  context 'when sunny' do
    before(:each) do
      allow(subject).to receive(:weather) { "sunny" }
    end

    describe '#land' do
      it 'lands a plane' do
        subject.land(@plane)
        expect(subject.planes).to include(@plane)
      end
      it 'prevents landing if airport is full' do
        subject.capacity.times { subject.land(Plane.new) }
        expect { subject.land(Plane.new) }.to raise_error("Cannot land, airport full")
      end
    end

    describe '#take_off' do
      it 'confirms plane is no longer at airport' do
        subject.land(@plane)
        subject.take_off(@plane)
        expect(subject.planes).not_to include(@plane)
      end
    end
  end

  context 'when stormy' do
    before(:each) do
      allow(subject).to receive(:weather) { "stormy" }
    end

    it 'prevents take off' do
      expect { subject.take_off(@plane) }.to raise_error("Stormy weather prevents take off")
    end
    it 'prevents landing' do
      expect { subject.land(@plane) }.to raise_error("Stormy weather prevents landing")
    end
  end
end
