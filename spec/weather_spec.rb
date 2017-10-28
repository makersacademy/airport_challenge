require 'weather'

describe Weather do
  subject(:weather) {described_class.new}

  it "should return that weather is clear" do
    expect(weather.clear?).to eq true
  end
end
