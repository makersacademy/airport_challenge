require "weather"

describe Weather do
  subject(:weather) { Weather.new }
  it "checks if its stormy" do
    allow(weather).to receive(:sample)
  end
end
