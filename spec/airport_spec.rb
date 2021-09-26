require "airport"

RSpec.describe Airport do

  let(:plane) { double :plane }
  let(:sunny_weather) { double :weather, :stormy? => false }
  let(:stormy_weather) { double :weather, :stormy? => true }

  it "creates a new airport" do
    expect(Airport.new).to be_instance_of Airport
  end

  it "can confirm not being full" do
    expect(subject.full?).to eq false
  end

  it "can confirm being full" do
    airport = Airport.new(1, "Moscow Sheremetyevo")
    airport.land(plane)
    expect(airport.full?).to eq true
  end

  it "can land a plane" do
    airport = Airport.new(6, "Moscow Sheremetyevo")
    expect(airport.land(plane)).to eq "Airport Moscow Sheremetyevo has 1 out of 6 planes inside."
  end

  it "can send a plane" do
    airport = Airport.new(8, "Moscow Sheremetyevo")
    expect(airport.departure(plane)).to eq "Airport Moscow Sheremetyevo has 0 out of 8 planes inside."
  end

  it "can check if the weather is not stormy" do
    airport = Airport.new(8, "Moscow Sheremetyevo", sunny_weather)
    expect(airport.stormy?).to eq false
  end

  it "can check if the weather is stormy" do
    airport = Airport.new(8, "Moscow Sheremetyevo", stormy_weather)
    expect(airport.stormy?).to eq true
  end

end 
