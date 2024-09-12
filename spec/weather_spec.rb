require "./lib/weather.rb"

describe Weather do
  
  it "generates random weather drizzle" do
  weather = Weather.new
  allow(weather).to receive(:rand).and_return(2)
  expect(weather.conditions(2)).to eq("drizzle")
  end

  it "generates random weather stormy" do
    weather = Weather.new
    allow(weather).to receive(:rand).and_return(3)
    expect(weather.conditions(3)).to eq("stormy")
    end

end