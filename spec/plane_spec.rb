require 'plane'

describe Plane do

  let(:plane) {Plane.new}
  let(:airport) {Airport.new}


  it "should be in flying status when plane takes off" do
    allow(airport).to receive(:weather_warning).and_return(:Fine)
    airport.land(plane)
    airport.take_off(plane)
    expect(subject.flying).to eq true
  end

  it "should not be able to land if already landed" do
    allow(airport).to receive(:weather_warning).and_return(:Fine)
    airport.land(plane)
    expect { airport.land(plane) }.to raise_error "Cannot land - plane is already landed"
  end

  it "take_off when airport take_off is called" do
    allow(airport).to receive(:weather_warning).and_return(:Fine)
    airport.land(plane)
    airport.take_off(plane)
    expect(plane.flying).to eq true
  end

  it "take_off deletes plane from landed array" do
    allow(airport).to receive(:weather_warning).and_return(:Fine)
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.landed).to eq []
  end
end
