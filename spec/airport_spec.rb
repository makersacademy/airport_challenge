require "Airport.rb"
require "Plane.rb"

describe Airport do

  it "allows a plane to land" do

    expect(subject.land Plane).to eq("Plane landed")
  end
end
