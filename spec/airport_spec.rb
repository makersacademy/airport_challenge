require "airport"

describe Airport do
  it { is_expected.to respond_to :land }

  it "instructs plane to land" do
    boeing_727 = Plane.new
    heathrow = Airport.new
    heathrow.land(boeing_727)
    expect(heathrow.planes).to include(boeing_727)
  end
end
