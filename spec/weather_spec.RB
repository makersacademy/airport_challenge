require './lib/weather.rb'

describe Weather do
  it "test if weather is stormy" do
    Weather.new
    expect(subject.stormy?).to be(true).or be(false)
  end
end
