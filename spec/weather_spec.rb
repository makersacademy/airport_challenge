require 'weather'

describe Weather do
  it "weather exists" do
    weather = Weather.new
    expect(weather).to be_an_instance_of(Weather)
  end

  it { is_expected.to respond_to :stormy? }

  it { is_expected.to respond_to :forecast }

  it "stormy to be true" do
    weather = Weather.new
    allow(weather).to receive(:forecast) { :stormy }
    expect(weather.stormy?).to be true
  end

end
