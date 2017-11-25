require 'plane'

describe Plane do
  let(:airport) { double(:my_airport) }

  it "should know when it is flying" do
    allow(airport).to receive(:takeoff) do |plane|
      plane.taking_off
    end
    airport.takeoff(subject)
    expect(subject.flying).to eq true
  end

  it "should know when it is landed" do
    allow(airport).to receive(:land) do |plane|
      plane.landing
    end
    airport.land(subject)
    expect(subject.flying).to eq false
  end

end
