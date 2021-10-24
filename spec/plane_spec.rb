require './../lib/plane.rb'
require './../lib/airport.rb'

describe Plane do

  it "lands at an airport" do
    jfk = Airport.new
    expect(subject.land(jfk)).to eq "Landed"
  end

  it "takes off from an airport" do
    jfk = Airport.new
    expect(subject.take_off(jfk)).to eq "Took off"
  end

  it "does not land if the airport is full" do
    jfk = Airport.new
    subject.land(jfk)
    expect(subject.land(jfk)).to eq "This airport is full - cannot land"
  end
end