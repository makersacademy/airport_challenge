require_relative "../lib/plane.rb"

describe Plane do

  it "arrives at an airport." do
    airport = Airport.new
    subject.departure
    expect(subject.arrive_at(airport)).to eq airport.identifier
  end

  it "takes off" do
    subject.departure
    expect(subject.location).to eq :air
  end

  it "raises error if plane tries to take off in the air" do
    subject.departure
    expect { subject.departure }.to raise_error("Plane already in the air")
  end

  it "raises error if tries to arrive at an airport before being in the air" do
    airport = Airport.new
    expect { subject.arrive_at(airport) }.to raise_error("Plane needs to take off from the ground before it arrive somewhere")
  end
end
