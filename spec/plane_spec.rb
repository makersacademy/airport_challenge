require 'plane'

describe Plane do

  it "makes planes on the ground" do
    expect(subject.location).to eq("The Factory")
  end

  it "can set @location to 'Airborn' while in flight" do
    expect(subject.airborn).to eq("Airborn")
  end

  it "can set @location to specific airport" do
    airport = Airport.new
    expect(subject.grounded(airport)).to eq(airport)
  end
end
