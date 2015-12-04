require './docs/airport.rb'

describe Plane do
  subject(:plane) {described_class.new}

  it "Checks if plane departs" do
    plane.depart
    expect(plane.flying).to eq true
  end
  
  it "Checks if a plane is landed" do
    plane.landed
    expect(plane.flying).to eq false
  end

end
