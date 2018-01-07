require_relative "../lib/weather.rb"

describe Weather do 
  it "forecast should return stormy or good" do
    expect(["good", "stormy"].include?(subject.forecast)).to be true
  end
end
