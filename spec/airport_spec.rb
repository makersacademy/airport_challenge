require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  let(:weather) { Weather }

  it 'should have a hangar area for the planes' do
    expect(airport.hangar.length).to eq 0
  end

  it 'should have a read attribute' do
    expect(airport).to respond_to(:capacity)
  end

  it 'should have a write attribute' do
    expect(airport).to respond_to(:capacity=)
  end

  it 'should have a default capacity of 30 planes' do
    expect(airport.capacity).to eq(Airport::DEFAULT_CAPACITY)
  end

  describe ' #land ' do
    it 'should instruct a plane to land at an airport' do
      expect(airport).to respond_to(:land).with(1).argument
    end

    it 'should park plane in hangar area' do
      expect_any_instance_of(weather).to receive(:generate).and_return('sunny')
      airport.land(plane)
      expect(airport.hangar).to include(plane)
    end

    it 'should prevent landing when weather is stormy' do
      expect_any_instance_of(weather).to receive(:generate).and_return('stormy')
      expect { airport.land(plane) }.to raise_error(RuntimeError,
        "Unable to land due to weather conditions")
    end

    it 'should raise an error when hangar has reached its capacity' do
      expect_any_instance_of(weather).to receive(:generate).and_return('sunny')
      airport.instance_variable_set(:@hangar, [Plane.new, Plane.new, Plane.new])
      expect { airport.land(plane) }.to raise_error(RuntimeError, "Unable to land. Hangar is full")
    end

  end

  describe ' #takeoff ' do
    it 'should instruct a plane to take off from an airport' do
      expect(airport).to respond_to(:takeoff).with(1).argument
    end

    it 'should return which plane is no longer in the airport' do
      airport.instance_variable_set(:@hangar, [plane])
      expect_any_instance_of(weather).to receive(:generate).and_return('sunny')
      expect(airport.takeoff(plane)).to eq("The #{plane} is no longer in the Airport")
    end

    it 'should prevent takeoff when weather is stormy' do
      expect_any_instance_of(weather).to receive(:generate).and_return('stormy')
      expect { airport.takeoff(plane) }.to raise_error(RuntimeError,
        "Unable to take off due to weather conditions")
    end

    it 'should remove plane from hangar area after take off' do
      different_plane = Plane.new
      airport.instance_variable_set(:@hangar, [plane, different_plane])
      expect_any_instance_of(weather).to receive(:generate).and_return('sunny')
      airport.takeoff(plane)
      expect(airport.hangar).not_to include(plane)
    end

    it 'should only release planes that are in the hangar' do
      airport.instance_variable_set(:@hangar, [])
      expect_any_instance_of(weather).to receive(:generate).and_return('sunny')
      expect { airport.takeoff(plane) }.to raise_error(RuntimeError,
        "Plane not available in hangar for takeoff")
    end
  end
end
