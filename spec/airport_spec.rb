require 'airport.rb'

describe Airport do
  plane = Plane.new

  it 'allows the user to create an Airport instance' do
    expect(subject).to be_instance_of(Airport)
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

  context '#full?' do
    error_message = 'Unable to land due to full airport'

    it 'prevents landing if airport full' do
      allow(subject).to receive(:full?).and_return(true)
      expect { subject.land(plane) }.to raise_error error_message
    end

    it 'raises an error when full' do
      subject.capacity.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error error_message
    end
  end

  describe '#capacity' do
    it 'sets the default airport capacity' do
      expect(subject.capacity).to eq(3)
    end
  end
end
