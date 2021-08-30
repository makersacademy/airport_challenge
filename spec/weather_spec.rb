require "weather"

describe Weather do

  it { is_expected.to be_instance_of(Weather) }

  it { is_expected.to respond_to :sunny? }

  it "is sunny" do
    allow(subject).to receive(:rand) { 65 }
    expect(subject.sunny?).to eq true
  end

  it "is definitely not sunny" do
    allow(subject).to receive(:rand) { 8 }
    expect(subject.sunny?).to eq false
  end
end
