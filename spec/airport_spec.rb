require 'airport'
require 'plane'

describe Airport do
  before(:each) do
    @plane = Plane.new
  end

  it 'has a default capacity of 20' do
    expect(subject.capacity).to eq(20)
  end
  it 'has a capacity of 50' do
  end

  context 'is sunny' do
    before(:each) do
      allow(subject).to receive(:weather) { "sunny" }
    end

    describe '#land' do
      it 'lands a plane' do
        subject.land(@plane)
        expect(subject.planes).to include(@plane)
      end
      it 'prevents landing if airport is full' do
        subject.land(@plane)
        second_plane = Plane.new
        expect { subject.land(second_plane) }.to raise_error("Cannot land, airport full")
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

  context 'is stormy' do
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
