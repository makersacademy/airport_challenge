require 'weather'

describe Weather do
  let(:weather) { Weather.new }

  it { is_expected.to be_an_instance_of Weather }

  it "can pick a random value from the options" do
    expect(weather.options).to include(weather.generate)
  end

  it "understands that it is stormy" do
    allow(weather).to receive(:generate).and_return(:stormy)
    expect(weather.stormy?).to be true
  end
end