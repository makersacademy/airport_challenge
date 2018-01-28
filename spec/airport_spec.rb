require 'airport'

describe Airport do

  subject(:airport) { described_class.new(weather) }
  let(:airport2) { described_class.new(weather, 10) }
  let(:plane) { double 'plane', :status= => "In air" }
  let(:plane2) { double 'plane2', :status= => "In air" }
  let(:weather) { double stormy?: false }

  it "is empty when created" do
    expect(subject.planes).to eq []
  end

  it "has default capacity if none is specified" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it "has specified capacity" do
    expect(airport2.capacity).to eq 10
  end

  describe '#land' do

    before(:each) do |test|
      subject.land(plane) unless test.metadata[:empty]
    end

    it "stores the plane in the airport" do
      expect(subject.planes).to include plane
    end

    it "raises an error if plane has already landed" do
      expect { subject.land(plane) }.to raise_error "Plane has already landed"
    end

    it "raises an error if the airport is full", :empty do
      allow(subject).to receive(:full?).and_return true
      expect { subject.land(plane) }.to raise_error "Airport is full"
    end

  end

  describe '#take_off' do

    before(:each) do |test|
      subject.land(plane) unless test.metadata[:empty]
    end

    it "releases a plane from the airport" do
      expect(subject.take_off(plane)).to eq plane
    end

    it "no longer stores plane in the airport" do
      subject.take_off(plane)
      expect(subject.planes).not_to include plane
    end

    it "raises an error if airport is empty", :empty do
      expect { subject.take_off(plane) }.to raise_error "No planes available"
    end

    it "raises an error if plane has already taken off" do
      subject.land(plane2)
      subject.take_off(plane)
      expect { subject.take_off(plane) }.to raise_error "Plane is already in the air"
    end

  end

  context 'When it is stormy' do

    describe '#land' do
      it "doesn't allow planes to land" do
        allow(weather).to receive(:stormy?).and_return true
        expect { subject.land(plane) }.to raise_error "It is too stormy to land"
      end
    end

    describe '#take_off' do
      it "doesn't allow planes to take off when stormy" do
        allow(weather).to receive(:stormy?).and_return(false)
        subject.land(plane)
        allow(weather).to receive(:stormy?).and_return(true)
        expect { subject.take_off(plane) }.to raise_error "It is too stormy to take off"
      end
    end

  end

end
