require 'airport'

describe Airport do
  let(:plane) { Plane.new }

  it 'can create an instance of Airport' do
    airport = Airport.new
    expect(airport).to be_kind_of Airport
  end

  describe '#initialize' do
    it 'initializes with an empty array if no arguments provided' do
      expect(subject.planes).to eq []
    end
  end

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'returns a plane that has landed' do
      expect(subject.land plane).to eq [plane]
    end

    it 'raises an error when full' do
      10.times { subject.land plane }
      expect { subject.land plane }.to raise_error "Airport is full"
    end
  end

  describe '#takeoff' do
    it { is_expected.to respond_to :takeoff }

    it 'has a plane take off' do
      subject.land plane
      expect(subject.takeoff).to eq plane
    end

    it 'decreases in count' do
      difference = 1

      subject.land plane
      initial_count = subject.planes.count

      subject.takeoff
      final_count = subject.planes.count

      expect(initial_count - final_count).to eq difference
    end

    it 'changes the plane to flying' do
      subject.land plane
      expect { subject.takeoff }.to change { plane.flying }.to true
    end

    it 'raises an error when there are no planes' do
      expect { subject.takeoff }.to raise_error "No planes are at the airport"
    end
  end

  # I want to prevent landing when the airport is full 
  
  # I would like a default airport capacity that can be overridden as appropriate

  # I want to prevent takeoff when weather is stormy 

  # I want to prevent landing when weather is stormy 
end
