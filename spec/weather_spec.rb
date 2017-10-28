require 'Weather'

describe Weather do
  subject(:weather) {described_class.new}
  it "should return that weather is stormy" do
    expect(weather.stormy?).to eq true
  end

  it "should return that weather is clear" do
    expect(weather.clear?).to eq true
  end
end
