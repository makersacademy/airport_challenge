require 'airport'

describe Airport do
  subject(:airport) { Airport.new }
  it { is_expected.to respond_to :land_plane }

  it "lands the plane" do
    plane = Plane.new
    airport.land_plane(plane)
    expect(plane.landed?).to eq true
  end

end
