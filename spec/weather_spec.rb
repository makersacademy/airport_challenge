require 'weather'

describe Weather do
  it "is stormy" do
    weather = Weather.new
    allow(weather).to receive(:state).and_return(94)

    expect(weather.stormy?).to eq(true)
  end

  it "is sunny" do
    weather = Weather.new
    allow(weather).to receive(:state).and_return(44)

    expect(weather.stormy?).to eq(false)
  end
end
