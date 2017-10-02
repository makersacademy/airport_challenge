require 'plane'

describe Plane do

  subject(:plane) { Plane.new }

  it "Confirms taken off plane is no longer in airport" do
    expect(plane.taken_off?).to be true
  end

end
