require 'airport'

describe Plane do

  it "Checks if a plane is flying" do
    expect(subject.flying).to eq true
  end

  it "Checks if a plane is landed" do
    airport = Airport.new
    airport.land(subject)
    expect(subject.flying).to eq false
  end

end
