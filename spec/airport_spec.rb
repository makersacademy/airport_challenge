require 'airport'
require 'plane'

describe Airport do
  before(:each) do
    @plane = Plane.new
  end

  it 'has a default capacity of 20' do
    expect(subject.capacity).to eq(20)
  end
  it 'has an overridden capacity of 50' do
    airport = Airport.new(50)
    expect(airport.capacity).to eq(50)
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
        20.times { subject.land(Plane.new) }
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
