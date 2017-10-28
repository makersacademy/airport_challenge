require 'Weather'

describe Weather do
  subject(:weather) {described_class.new}
  it "should return that weather is stormy" do
    expect(weather.stormy?).to eq true
  end
end
