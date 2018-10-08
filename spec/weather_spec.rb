require 'weather.rb'

describe Weather do
  it { is_expected.to respond_to :stormy? }

  it "returns false when sunny" do
    allow(Random).to receive(:rand).and_return(5)
    expect(subject.stormy?).to eq true
  end

  it "returns true when stormy" do
    allow(Random).to receive(:rand).and_return(1)
    expect(subject.stormy?).to eq false
  end
end
