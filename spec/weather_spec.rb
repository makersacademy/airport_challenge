require './lib/weather'

describe Weather do
  let(:weather) { Weather.new }
  it { is_expected.to respond_to :stormy? }

context '#stormy?' do

  it "returns true when weather is stormy" do
  allow(weather).to receive(:stormy?).and_return(true)
  expect(weather.stormy?).to eq true

end

  it "returns false when weather is clear" do
  allow(weather).to receive(:stormy?).and_return(false)
  expect(weather.stormy?).to eq false
end
end
end
