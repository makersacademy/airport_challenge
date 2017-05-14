require_relative "../lib/plane.rb"

describe Plane do

  it "takes off" do
    subject.departure
    expect(subject.location).to eq :air
  end

  it "arrives at an airport." do
    airport = Airport.new
    subject.departure
    expect(subject.arrive_at(airport)).to eq airport.identifier
  end

  it "raises error if plane tries to take off while the air" do
    subject.departure
    expect { subject.departure }.to raise_error(PlaneError)
  end

  it "raises error if tries to arrive to an airport before being in the air" do
    airport = Airport.new
    expect { subject.arrive_at(airport) }.to raise_error(PlaneError)
  end
end
