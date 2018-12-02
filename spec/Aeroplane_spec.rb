require "Aeroplane.rb"
# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport

describe Plane do
  it { is_expected.to respond_to(:land) }
end
