require 'airport'
require 'plane'

describe Airport do

  let(:plane) { Plane.new }

  it { is_expected.to be_kind_of(described_class) }
  it { is_expected.to respond_to(:weather?) }
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }

  it 'has a default capacity' do
    expect(subject.capacity).to eq(described_class::DEFAULT_CAPACITY)
  end

  describe '#weather?' do
    it "returns the weather (mainly sunny)" do
      expect_any_instance_of(Object).to receive(:rand).with(4).and_return(0)
      expect(subject.weather?).to eq("Sunny")

      expect_any_instance_of(Object).to receive(:rand).with(4).and_return(1)
      expect(subject.weather?).to eq("Sunny")

      expect_any_instance_of(Object).to receive(:rand).with(4).and_return(2)
      expect(subject.weather?).to eq("Sunny")

      expect_any_instance_of(Object).to receive(:rand).with(4).and_return(3)
      expect(subject.weather?).to eq("Stormy")
    end
  end
  
  describe '#landing plane' do
    it 'error if airport is at capacity' do
      allow(subject).to receive(:weather?) { "Sunny" }
      subject.capacity.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error("Airport is full")
    end

    it 'land if weather is sunny' do
      allow(subject).to receive(:weather?) { "Sunny" }
      expect(subject.land(plane)).to eq([plane])
    end

    it 'error if weather is stormy' do
      allow(subject).to receive(:weather?) { "Stormy" }
      expect { subject.land(plane) }.to raise_error("Stormy weather: do not land")
    end
  end
 
  describe '#taking off' do
    it 'error if plane is not in airport' do
      allow(subject).to receive(:weather?) { "Sunny" }
      expect { subject.take_off(Plane.new) }.to raise_error("Plane not at airport")
      # expect { (subject.airport).not_to include(plane) }.to raise_error("Plane not at airport")
    end

    it 'take off if weather is sunny' do
      allow(subject).to receive(:weather?) { "Sunny" }
      subject.land(plane)
      expect(subject.hangar).to include(plane)
      subject.take_off(plane)
      expect(subject.hangar).not_to include(plane)
    end

    it 'error if weather is stormy' do
      allow(subject).to receive(:weather?) { "Stormy" }
      expect { subject.take_off(plane) }.to raise_error("Stormy weather: do not fly")
    end
  end
end
