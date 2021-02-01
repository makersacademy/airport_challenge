require "airport"
require "plane"

describe "Feature Test" do
  let(:airport) { Airport.new("Gatwick", 100) }
  let(:airport_2) { Airport.new("Heathrow", 100) }
  let(:planes) { double plane }
    
  it "Views Airport name" do
    expect(airport.airport_name).to eq("Gatwick")
  end

  it "Checks total airport capacity" do
    expect(airport.total_capacity).to eq(100)
  end

  it "Checks Weather" do
    allow(airport).to receive(:weather_generator).and_return("sunny")
    expect(airport.weather_generator).to eq("sunny")
  end

  it "Lands a plane at an airport" do
    allow(airport).to receive(:weather_stormy?).and_return false
    expect { airport.land_plane(:plane) }.not_to raise_error
  end  

  it "Takes off a plane at an airport" do
    allow(airport).to receive(:weather_stormy?).and_return false
    airport.land_plane(:plane)
    expect { airport.takeoff_plane(:plane) }.not_to raise_error
  end  

  it "No planes can land when the airport is full" do
    allow(airport).to receive(:weather_stormy?).and_return false
    100.times do
      airport.land_plane(:plane)
    end
    expect { airport.land_plane(:plane) }.to raise_error "Airport is full!"
  end

  it "No planes can land when the airport weather is stormy" do
    allow(airport).to receive(:weather_stormy?).and_return true
    expect { airport.land_plane(:plane) }.to raise_error "The Airport is stormy!"
  end
  it "No planes can takeoff when the airport weather is stormy" do
    allow(airport).to receive(:weather_stormy?).and_return true
    expect { airport.takeoff_plane(:plane) }.to raise_error "The Airport is stormy!"
  end

end
