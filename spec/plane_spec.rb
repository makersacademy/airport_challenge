require 'plane'

describe Plane do
  let(:plane) {
    Plane.new
  }
  let(:fake_weather) {
    double Weather.new
  }
  it "can land" do
    expect(plane).to respond_to(:land)
  end
  
  it "knows it landed" do
    allow(fake_weather).to receive(:stormy) { false }
    expect(plane.land(fake_weather)).to be true
  end

  it "knows it took off" do 
    allow(fake_weather).to receive(:stormy) { false }
    expect(plane.take_off(fake_weather)).to be true
  end

  it "cannot take off if the weather is stormy" do
    allow(fake_weather).to receive(:stormy) { true }
    expect(plane.take_off(fake_weather)).to be false
  end

  it "cannot land if the weather is stormy" do
    allow(fake_weather).to receive(:stormy) { true }
    expect(plane.land(fake_weather)).to be false
  end

  it "cannot land if the TRUE weather is stormy" do
    srand(5) # stormy is true => chosen_state = 4
    weather = Weather.new
    expect(plane.land(weather)).to be false
  end
end
