require 'plane'

describe Plane do

  it "make sure new planes are flying" do
    expect(subject.flying).to eq true
  end

  it "once planes have landed, they are no longer 'flying'" do
    airport = AirPort.new
    allow(airport).to receive(:good_weather?) { true }
    airport.land(subject)
    expect(subject.flying).to eq false
  end

end
