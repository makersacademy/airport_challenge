require './lib/weather.rb'

describe Weather do
  it { is_expected.to respond_to(:stormy?) }

  it "returns true or false when asked if stormy" do
    expect(subject.stormy?).to eq true if subject.stormy?
    expect(subject.stormy?).to eq false if !subject.stormy?
  end
end
