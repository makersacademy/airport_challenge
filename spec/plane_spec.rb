require 'plane'

describe Plane do
  subject(:landed_plane) { described_class.new}
  subject(:flying_plane) { described_class.new}

  it "confirms that the plane has landed" do
    landed_plane.land
    expect(landed_plane.landed?).to be true
  end

  it "raises an error if the same plane attempts to land" do
    landed_plane.land
    expect { landed_plane.land }.to raise_error("This plane has already landed!")
  end

  it "confirms that the plane is flying" do
    flying_plane.land
    flying_plane.take_off
    expect(flying_plane.flying?).to be true
  end

  it "raises an error if the same plane attempts to take off" do
    flying_plane.land
    flying_plane.take_off
    expect { flying_plane.take_off }.to raise_error("This plane is already flying!")
  end

end
