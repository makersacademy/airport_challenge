require 'plane'

describe Plane do
  subject(:plane) { described_class.new }
  subject(:landed_plane) { described_class.new }
  subject(:flying_plane) { described_class.new }

  it "confirms that the plane has landed" do
    landed_plane.landed = true
    expect(landed_plane.landed?).to be true
  end

  it "confirms that the plane is flying" do
    flying_plane.landed = false
    expect(flying_plane.flying?).to be true
  end

end
