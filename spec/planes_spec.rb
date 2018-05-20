require 'plane'

describe Plane do

  it "plane exists" do
    airport = Airport.new
    expect(airport.subject).to exist
  end

end
