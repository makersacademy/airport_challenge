require 'weather'
include Weather

describe "Weather Module" do
  it "generates weather randomly - 5% chance of storms - stubbed with Stormy" do
    allow(Weather).to receive(:generate_weather).and_return("Stormy")
    expect(Weather.generate_weather).to eq("Stormy")
  end
  it "generates weather randomly - 5% chance of storms - stubbed with Sunny" do
      allow(Weather).to receive(:generate_weather).and_return("Sunny")
    expect(generate_weather).to eq("Sunny")
  end
end
