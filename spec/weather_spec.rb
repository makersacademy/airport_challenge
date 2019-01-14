require "weather"

describe Weather do
  it { is_expected.to respond_to(:stormy?) }
end

describe Weather do
  it "generates random number for weather conditions" do
    expect(subject).to receive(:rand).and_return(2)
    expect(subject.stormy?).to eq false
  end
end
