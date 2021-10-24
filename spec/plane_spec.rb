require './../lib/plane.rb'

describe Plane do

  it "lands at an airport" do
    expect(subject.land("JFK")).to eq "Landed at JFK"
  end

  it "takes off from an airport" do
    expect(subject.take_off("JFK")).to eq "Took off from JFK"
  end
end