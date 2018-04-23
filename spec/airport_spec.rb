require 'airport'

describe AirPort do
  let(:airport) { AirPort.new }
  let(:plane) { Plane.new }
  let(:weather) { Weather }

  it 'should give a langing bay for the planes' do
    expect(airport.landing_bays.length).to eq 0
  end

  it 'should have a read attribute' do
    expect(airport).to respond_to(:capacity)
  end

  it 'should have a write attribute' do
    expect(airport).to respond_to(:capacity=)
  end

  it 'should have a default capacity of 50 planes' do
    expect(airport.capacity).to eq(Airport::DEFAULT_CAPACITY)
  end

  describe ' #land ' do
    it 'should instruct a plane to land at an airport' do
      expect(airport).to respond_to(:land).with(1).argument
    end

    it 'should park plane in landing bay area' do
      expect_any_instance_of(weather).to receive(:produce).and_return('sunny')
      expect { airport.land(plane) }.to change { airport.landing_bays.length }.by(1)
    end

    it 'should prevent landing when weather is stormy' do
      expect_any_instance_of(weather).to receive(:produce).and_return('stormy')
      expect { airport.land(plane) }.to raise_error(RuntimeError,
        "Cannot and due to weather conditions")
    end
  end

  describe ' takeoff ' do
    it 'should instruct a plane to take off from an airport' do
      expect(airport).to respond_to(:takeoff).with(1).argument
    end

    it 'should return which plane is no longer in the airport' do
      expect_any_instance_of(weather).to receive(:produce).and_return('sunny')
      expect(airport.takeoff(plane)).to eq("The #{plane} is no longer in the Airport")
    end

    it 'should prevent takeoff when weather is stormy' do
      expect_any_instance_of(weather).to receive(:produce).and_return('stormy')
      expect { airport.takeoff(plane) }.to raise_error(RuntimeError,
        "Unable to take off due to weather conditions")
    end

    it 'should remove plane from hangar area after take off' do
      airport.instance_variable_set(:@landing_bays, [plane])
      expect_any_instance_of(weather).to receive(:produce).and_return('sunny')
      expect { airport.takeoff(plane) }.to change { airport.landing_bays.length }.by(-1)
    end

  end
end