require 'airport'
require 'plane'

describe Airport do
  before(:each) do
    @plane = Plane.new
  end

  context 'is sunny' do
    before(:each) do
      allow(subject).to receive(:weather) { "sunny" }
    end

    describe '.land' do
      it 'lands a plane' do
        subject.land(@plane)
        expect(subject.planes).to include(@plane)
      end
    end

    describe '.take_off' do
      it { is_expected.to respond_to(:take_off).with(1).argument }
      it 'confirms plane is no longer at airport' do
        subject.land(@plane)
        subject.take_off(@plane)
        expect(subject.planes).to eq([])
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
