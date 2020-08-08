require 'airport'

describe Airport do
  it 'can create an instance of Airport' do
    airport = Airport.new
    expect(airport).to be_kind_of(Airport)
  end

  describe '#initialize' do
    it 'initializes with an empty array if no arguments provided' do
      expect(subject.planes).to eq []
    end
  end

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'returns a plane that has landed' do
      plane = Plane.new
      expect(subject.land(plane)).to eq [plane]
    end
  end

  describe '#takeoff' do
    # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
    it { is_expected.to respond_to :takeoff }

    it 'has a plane take off' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.takeoff).to eq plane
    end

    it 'decreases in count after takeoff' do
      difference = 1

      plane = Plane.new
      subject.land(plane)
      initial_count = subject.planes.count

      subject.takeoff
      final_count = subject.planes.count

      expect(initial_count - final_count).to eq(difference)
    end

  end

  # I want to prevent landing when the airport is full 
  
  # I would like a default airport capacity that can be overridden as appropriate

  # I want to prevent takeoff when weather is stormy 

  # I want to prevent landing when weather is stormy 
end
