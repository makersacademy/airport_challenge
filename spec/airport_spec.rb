require 'airport'

describe Airport do
  let (:plane) {double :plane}
  let (:forecast) {double :forecast, :stormy? => false}

  it "allows planes to land and confirms" do
    expect(subject.land(plane)).to eq plane
  end

  it "stores landed airplanes" do
    airport = subject
    airport.land(plane)
    expect(airport.planes).to include plane
  end

  it "allows planes to take off" do
    airport = subject
    airport.land(plane)
    expect(airport.take_off(plane, forecast)).to eq plane
  end

  it "doesn't contain planes that did take off" do
    airport = subject
    airport.land(plane)
    airport.take_off(plane, forecast)
    expect(airport.planes).not_to include plane
  end

  describe "behaviour during stormy weather" do
    let (:forecast) {double :forecast, :stormy? => true}

    it "prevents taking off when weather is stormy" do
      airport = subject
      airport.land(plane)
      expect{airport.take_off(plane, forecast)}.to raise_error
    end

  end

end
