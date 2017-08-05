# require_relative "../lib/plane.rb"

describe Plane do

  let(:airport) { double(:airport) }

  it "takes off" do
    subject.take_off
    expect(subject.location).to eq :air
  end

  it "arrives at an airport with safe weather." do
    airport = double(:airport, identifier: :DEF, weather: :safe)
    subject.take_off
    expect(subject.land_at(airport)).to eq airport
  end

  it "raises error if plane tries to take off while the air" do
    subject.take_off
    expect { subject.take_off }.to raise_error(PlaneError)
  end

  it "raises error if tries to arrive to an airport before being in the air" do
    airport = double(:airport)
    allow(airport).to receive(:weather) { :safe }
    expect { subject.land_at(airport) }.to raise_error(PlaneError)
  end
end
