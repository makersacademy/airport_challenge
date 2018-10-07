require "airport"

describe Airport do

  let (:plane) { double(:plane, land: true) }
  let (:airport) { Airport.new }

  it "can be full of planes" do
    10.times { airport.hanger << plane }
    expect(airport).to be_full

  end

end
