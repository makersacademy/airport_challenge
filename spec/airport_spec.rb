require 'airport.rb'

describe Airport do
  plane = Plane.new
  weather = Weather.new

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

    it 'confirms a plane is in the airport' do
      subject.land(plane)
      expect(subject.planes).to include(plane)
    end
  end

  describe '#take_off' do
    plane_2 = Plane.new

    it 'instructs a plane to take off from an airport' do
      expect(subject).to respond_to(:take_off).with(1).argument
    end

    it 'confirms that the plane is no longer in the airport' do
      allow(weather).to receive(:stormy?).and_return(false)
      subject.land(plane_2)
      subject.take_off(plane_2)
      expect(subject.planes).not_to include(plane_2)
    end
  end

  context '#full?' do
    error_message = 'Unable to land due to full airport'

    it 'prevents landing if airport full' do
      allow(subject).to receive(:full?).and_return(true)
      expect { subject.land(plane) }.to raise_error(error_message)
    end

    it 'raises an error when full' do
      subject.capacity.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error(error_message)
    end
  end

  describe '#capacity' do
    it 'sets the default airport capacity' do
      expect(subject.capacity).to eq(3)
    end
  end

  context '#stormy?' do
    error_message_2 = 'Unable to take off due to stormy weather'

    it 'prevents take off if weather stormy' do
      allow(weather).to receive(:stormy?).and_return(true)
      expect { subject.take_off(plane) }.to raise_error(error_message_2)
    end
  end
end
