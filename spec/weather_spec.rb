require "weather"
describe Weather do
  it "it asks if the weather is stormy" do
    expect(Weather.new.stormy?).to eq true
  end
end
