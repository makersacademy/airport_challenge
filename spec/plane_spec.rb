require './lib/plane.rb'

describe Plane do
# plane has a status of flying or in an airport

  it { is_expected.to respond_to(:take_off) }
  it { is_expected.to respond_to(:status).with(1).argument }
  it { is_expected.to respond_to(:land) }
    # LANDING
# if plane tries to land but if not flying, error message returned

# if plane ties to land but it's stormy, error message returned

# if plane tries to land but airport is full, error message returned

# if plane lands, change location to airport

# TAKEOFF
# if plane tries to take off but isn't flying, error message returned

# if plane tries to take off but weather is stormy, error mesage returned

# if plane takes off, change location to flying
end
