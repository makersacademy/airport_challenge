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
      expect { airport.land(plane) }.to change { airport.hangar.length }.by(1)
    end

    it 'should prevent landing when weather is stormy' do
      expect_any_instance_of(weather).to receive(:generate).and_return('stormy')
      expect { airport.land(plane) }.to raise_error(RuntimeError,
        "Unable to land due to weather conditions")
    end
  end

  describe ' #takeoff ' do
    it 'should instruct a plane to take off from an airport' do
      expect(airport).to respond_to(:takeoff).with(1).argument
    end

    it 'should return which plane is no longer in the airport' do
      expect_any_instance_of(weather).to receive(:generate).and_return('sunny')
      expect(airport.takeoff(plane)).to eq("The #{plane} is no longer in the Airport")
    end

    it 'should prevent takeoff when weather is stormy' do
      expect_any_instance_of(weather).to receive(:generate).and_return('stormy')
      expect { airport.takeoff(plane) }.to raise_error(RuntimeError,
        "Unable to take off due to weather conditions")
    end

    it 'should remove plane from hangar area after take off' do
      airport.instance_variable_set(:@hangar, [plane])
      expect_any_instance_of(weather).to receive(:generate).and_return('sunny')
      expect { airport.takeoff(plane) }.to change { airport.hangar.length }.by(-1)
    end

  end
end

# Bugs to fix: make sure I can't take off the plane if not in airport
#              can't land if already in airport
#              - (include method?)*
#              change my weather generator to use rand numbers
#
# Use a random number generator to set the weather (it is normally
# sunny but on rare occasions it may be stormy). In your tests, you'll
# need to use a stub to override random weather to ensure consistent
# test behaviour.
#
# planes can only take off from airports they are in
# planes that are already flying cannot take off
# *and/or be in an airport
# planes that are landed cannot land again and must be in an airport
#
# For overriding random weather behaviour, please read the documentation
# to learn how to use test doubles:
# https://www.relishapp.com/rspec/rspec-mocks/docs .

# hangar.length can be no longer than DEFAULT_CAPACITY
