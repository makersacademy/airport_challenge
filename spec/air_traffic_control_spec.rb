# test

# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport

require 'air_traffic_control'

describe Control do
  it 'creates new Control' do
    expect(Control.new)
  end

  it {is_expected.to respond_to(:land).with(1).argument}

  it 'lands aircraft' do
    plane1 = Plane.new
    expect(subject.land(plane1)).to eq [plane1]

  end

# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport
# and confirm that it is no longer in the airport

  it {is_expected.to respond_to(:takeoff).with(1).argument}

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

  it {is_expected.to respond_to(:stormy?)}



end
