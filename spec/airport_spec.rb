require 'airport'

describe Airport do
  let (:plane) {double :plane}
  let (:weather) {double :weather, :stormy? => true}

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
    expect(airport.take_off(plane)).to eq plane
  end

  it "doesn't contain planes that did take off" do
    airport = subject
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.planes).not_to include plane
  end

  it "prevents taking off when weather is stormy" do
    airport = subject
    airport.land(plane)
    weather = double(:weather, :stormy? => false)
    expect(airport.take_off(plane)).to raise_error "Planes aren't allowed to take off during stormy weather"
  end


end
