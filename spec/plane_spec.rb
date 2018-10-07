require './lib/plane'

describe Plane do
  let(:airport) { Airport.new }


  it "can return it's location" do
    expect(subject.location).to eq "air"
  end

  it "location set to airport upon landing" do
    allow(airport).to receive(:check_weather).and_return("sunny")
    airport.land(subject)
    expect(subject.location).to eq airport.object_id
  end

  it "location set after take off" do
    allow(airport).to receive(:check_weather).and_return("sunny")
    airport.land(subject)
    airport.take_off(subject)
    expect(subject.location).to eq "air"
  end

end
