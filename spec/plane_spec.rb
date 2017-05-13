require_relative "../lib/plane.rb"

describe Plane do

  it "lands at an airport." do
    airport = Airport.new
    expect(subject.lands_at(airport)).to eq subject.location
  end

  it "takes off" do
    expect(subject.takes_off).to eq :air
  end
end
