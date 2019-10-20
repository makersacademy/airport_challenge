require 'weather'

describe Weather do
  let(:weather) { Weather.new }

  it "is stormy" do
    expect(weather.forecast).to eq "Stormy"
  end
end
