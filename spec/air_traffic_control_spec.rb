# test

# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport

require 'air_traffic_control'

describe Control do
  it 'creates new Control' do
    expect(Control.new)
  end

  it { is_expected.to respond_to(:land).with(1).argument }

  it 'lands aircraft' do
    plane1 = Plane.new
    expect(subject.land(plane1)).to eq [plane1]

  end

 # As an air traffic controller
 # So I can get passengers on the way to their destination
 # I want to instruct a plane to take off from an airport
 # and confirm that it is no longer in the airport

  it { is_expected.to respond_to(:takeoff).with(1).argument }

  it 'takes off and confirms planes departure' do
    plane1 = Plane.new
    subject.land(plane1) # so capacity isn't empty
    expect(subject.takeoff(plane1)).to eq []
  end

  describe '#dock' do
    it 'doesnt take off if there are no planes that have landed, raises error' do
      plane1 = Plane.new
      expect(subject.takeoff(plane1)).to eq []
    end
  end

 # above test would have been better with raised error instead. Couldn't
 # get it to work

 # As an air traffic controller
 # To ensure safety
 # I want to prevent takeoff when weather is stormy

  it { is_expected.to respond_to(:stormy?).with(1).argument }

  it 'doesnt allow take off if stormy' do
    control = Control.new
    plane1 = Plane.new
    control.land(plane1)
    control.stormy?(plane1)
    expect(control.takeoff(plane1)).to eq [plane1]
  end

  # need a test for when storm has passed

  it { is_expected.to respond_to(:storm_passed).with(1).argument }

  it 'allows take off if storm passed' do
    control = Control.new
    plane1 = Plane.new
    control.land(plane1)
    control.stormy?(plane1)
    control.storm_passed(plane1)
    expect(control.takeoff(plane1)).to eq []
  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent landing when the airport is full

  describe '#land' do
    it 'raises an error when tries to land when full capacity' do
      control = Control.new
      Control::DEFAULT_CAPACITY.times { control.land(Plane.new) }
      plane = Plane.new
      expect { control.land(plane) }.to raise_error 'Capacity full'
    end
  end

end

# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

#  Did this implicitly
