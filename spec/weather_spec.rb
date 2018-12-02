require 'weather'
require 'airport'

describe Weather do
  it "it allows us to check if weather is stormy" do
    allow(Weather).to receive(:stormy)
    expect(Weather.new.stormy).to be(true).or be(false)
  end
end
