require './lib/plane'

describe Plane do
  let(:airport) { Airport.new }

  it "can return it's location" do
    expect(subject.location).to eq "air"
  end

  it "location set to airport upon landing" do
    airport.land(subject)
    expect(subject.location).to eq airport
  end

  it "location set after take off" do
    airport.land(subject)
    airport.take_off(subject)
    expct(subject.location).to eq "air"
  end

end
