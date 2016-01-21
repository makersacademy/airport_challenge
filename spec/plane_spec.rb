require 'plane'

describe Plane do
  subject(:plane) {described_class.new}

  it{is_expected.to respond_to(:land)}
  # Plane should have a .land method

  it{is_expected.to respond_to(:takeoff)}
  # Plane should have a .takeoff method

end
