require 'plane'

describe Plane do
  it "knows it's current airport" do
    expect(Plane.new(1234)).to respond_to(:current_airport)
  end
end
