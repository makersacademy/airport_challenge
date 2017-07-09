require 'Airport'
require 'Plane'

describe Airport do
  subject(:airport) { described_class.new }
  subject(:plane) { Plane.new }

  it "instructs a plane to land" do
    expect(airport).to respond_to(:land_plane)
  end

  it "confirms that plane has landed" do

  end

  it "instructs a plane to take off" do
    expect(airport).to respond_to(:take_off_plane)
  end

  it "confirms that plane is no longer at the airport" do

  end

end
