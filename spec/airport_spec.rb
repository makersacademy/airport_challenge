require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  let(:weather) { Weather }

  it 'should have a hangar area for the planes' do
    expect(airport.hangar).to eq([])
  end

  it 'should have a read attribute capacity' do
    expect(airport).to respond_to(:capacity)
  end

  it 'should have a write attribute capacity' do
    expect(airport).to respond_to(:capacity=)
  end

  it 'should have a default capacity' do
    expect(airport.capacity).to eq(Airport::DEFAULT_CAPACITY)
  end

  describe ' #land ' do
    it 'should allow a plane to land' do
      expect(airport).to respond_to(:land).with(1).argument
    end

    it 'should park planes in the hangar' do
      expect_any_instance_of(weather).to receive(:generate).and_return('sunny')
      airport.land(plane)
      expect(airport.hangar).to include(plane)
    end

    it 'raises an error when weather is stormy' do
      expect_any_instance_of(weather).to receive(:generate).and_return('stormy')
      expect { airport.land(plane) }.to raise_error(RuntimeError,
        "Unable to land due to weather conditions")
    end

    it 'raises an error when hangar has reached full capacity' do
      expect_any_instance_of(weather).to receive(:generate).and_return('sunny')
      airport.instance_variable_set(:@hangar, [Plane.new, Plane.new, Plane.new])
      expect { airport.land(plane) }.to raise_error(RuntimeError,
         "Unable to land. Hangar is full")
    end

  end

  describe ' #takeoff ' do
    it 'should allow a plane to take off' do
      expect(airport).to respond_to(:takeoff).with(1).argument
    end

    it 'should return which plane is no longer in the airport' do
      airport.instance_variable_set(:@hangar, [plane])
      expect_any_instance_of(weather).to receive(:generate).and_return('sunny')
      expect(airport.takeoff(plane)).to eq("The #{plane} is no longer in the Airport")
    end

    it 'raises an error when weather is stormy' do
      expect_any_instance_of(weather).to receive(:generate).and_return('stormy')
      expect { airport.takeoff(plane) }.to raise_error(RuntimeError,
        "Unable to take off due to weather conditions")
    end

    it 'should remove the correct plane from the hangar' do
      different_plane = Plane.new
      airport.instance_variable_set(:@hangar, [plane, different_plane])
      expect_any_instance_of(weather).to receive(:generate).and_return('sunny')
      airport.takeoff(plane)
      expect(airport.hangar).not_to include(plane)
    end

    it 'raises an error when plane is not in the hangar' do
      expect_any_instance_of(weather).to receive(:generate).and_return('sunny')
      expect { airport.takeoff(plane) }.to raise_error(RuntimeError,
        "Plane not available in hangar for takeoff")
    end
  end
end
