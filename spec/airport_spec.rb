require 'airport'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:takeoffplane) }
  it { is_expected.to respond_to(:capacity) }

  describe 'initialize' do
    it 'has a variable capacity' do
      airport = Airport.new(100)
      100.times { airport.land(Plane.new) }
      expect{ airport.land(Plane.new) }.to raise_error 'Airport is full to capacity'
    end

    it 'has a default capacity' do
      subject { Airport.new }
      plane = Plane.new
      described_class::DEFAULT_CAPACITY.times do
        subject.land(plane)
      end
      expect{ subject.land(plane) }.to raise_error 'Airport is full to capacity'
    end
  end

  describe '#land' do
    it 'lands a plane' do
      plane = Plane.new
      expect(subject.land(plane)).to eq [plane]
    end

    it 'returns a landed plane' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.planes).to include plane
    end

    it 'returns an error if the airport if full' do
      subject.capacity.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error 'Airport is full to capacity'
    end
  end

  describe '#takeoffplane' do
    it 'takes off a plane' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.takeoffplane).to eq plane
    end

    it 'removes plane from airport' do
      plane = Plane.new
      subject.land(plane)
      subject.takeoffplane
      expect(subject.planes).not_to include plane
    end

    it "returns an error if the airport is empty" do
      expect { subject.takeoffplane }.to raise_error 'No planes available for takeoff'
    end
  end
end
