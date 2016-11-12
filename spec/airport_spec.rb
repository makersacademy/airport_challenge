require 'airport.rb'
# require 'plane.rb'

describe Airport do

let(:plane) {double :plane}
subject(:airport) {described_class.new}

  describe '#planes' do

    it 'returns planes which have landed' do
      allow(plane).to receive(:land)
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end

  end

  describe '#capacity' do

    it 'has a variable capacity' do
      subject.capacity = 60
      60.times do
        plane = double(:plane)
        allow(plane).to receive(:land)
        subject.land(plane)
      end
      plane = double(:plane)
      expect { subject.land(plane) }.to raise_error 'Airport is full'
    end

  end

  describe '#initialization' do

    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        plane = double(:plane)
        allow(plane).to receive(:land)
        subject.land(plane)
      end
      expect { subject.land(plane) }.to raise_error 'Airport is full'
    end

  end

  describe '#land' do

    it 'lands a plane' do
      allow(plane).to receive(:land)
      subject.land(plane)
      expect(subject.planes).to include plane
    end

    it 'raises an error if plane is already in airport' do
      plane = Plane.new
      subject.land(plane)
      expect {subject.land(plane)}.to raise_error 'Plane already in airport'
    end


    it 'raises an error if airport is full' do
      described_class::DEFAULT_CAPACITY.times do
        plane = double(:plane)
        allow(plane).to receive(:land)
        subject.land(plane)
      end
      expect {subject.land(plane)}.to raise_error 'Airport is full'
    end

    it 'changes the landed status of the plane' do
      expect(plane).to receive(:land)
      subject.land(plane)
    end

  end

  describe '#take_off' do

    it 'raises an error if plane is not in airport' do
      expect {subject.take_off(plane)}.to raise_error 'Plane is not in airport'
    end

    it 'changes the landed status of the plane' do
      expect(plane).to receive(:take_off)
      allow(plane).to receive(:land)
      subject.land(plane)
      subject.take_off(plane)
    end

    it 'lets a plane take off from the airport' do
      allow(plane).to receive(:land)
      allow(plane).to receive(:take_off)
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).not_to include plane
    end

  end

end
