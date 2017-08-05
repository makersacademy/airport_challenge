require_relative '../lib/weather'

describe Weather do

  it "weather generated" do
    weather = Weather.new
    expect(weather).to respond_to(:generate)
  end
  
end
