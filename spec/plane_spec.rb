require 'plane'

describe Plane do

  it "makes planes on the ground" do
    expect(subject.location).to eq("The Factory")
  end

  it "sets @location to 'Airborn' while in flight" do
    subject.airborn
    expect(subject.location).to eq("Airborn")
  end
end
