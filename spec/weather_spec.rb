require 'weather'

describe Weather do
  it "is stormy" do
    weather = Weather.new
    expect( weather.stormy ).to eq false
  end

  it "is not sotrmy" do
    weather = Weather.new
    expect( weather.not_stormy ).to eq true
  end
end
