require 'airport'

describe Airport do

  it 'initializaes with a default capacity' do
    expect(subject.capacity).to eq 1
  end

  it 'can initialize with a custom capacity' do
    airport = Airport.new(capacity: 30)
    expect(airport.capacity).to eq 30
  end

  it 'initializes with "calm" weather' do
    expect(subject.weather).to eq "calm"
  end

  it "can initialize with any weather" do
    airport = Airport.new(weather: "wind")
    expect(airport.weather).to eq "wind"
  end

  it "can see a storm blow over" do
    expect(Airport.new.storm_switch.weather).to eq "storm"
    expect(Airport.new.storm_switch.storm_switch.weather).to eq "calm"
  end
end
