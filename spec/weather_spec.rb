require 'weather.rb'

describe Weather do
  today = Weather.new

  it "weather can be stormy" do
    allow(today).to receive(:forecast) {"stormy"}
    today.forecast
    expect(today.forecast).to eq("stormy")
  end

  it "weather can be sunny" do
    allow(today).to receive(:forecast) {"sunny"}
    today.forecast
    expect(today.forecast).to eq("sunny")
  end

end
