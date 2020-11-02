require 'airport.rb'

describe Airport do
  plane = Plane.new

  it 'allows the user to create an Airport instance' do
    expect(subject).to be_instance_of Airport
  end

  describe '#land' do
    it 'instructs a plane to land at an airport' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'lands a plane at an airport' do
      expect(subject.land(plane)).to eq([plane])
    end
  end

  describe '#take_off' do
    it 'instructs a plane to take off from an airport' do
      expect(subject).to respond_to(:take_off).with(1).argument
    end

    it 'confirms that the plane is no longer in the airport' do
      subject.land(plane)
      expect(subject.take_off(plane)).to eq(subject.planes)
    end
  end
end
