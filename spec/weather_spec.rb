require 'weather'

describe Weather do
  it { is_expected.to respond_to(:stormy) }

  it 'sets @stormy? to true if Weather object initialized with number >= 90' do
    allow(subject).to receive(:number) { 92 }
    expect(subject.stormy).to eq(true)
  end

  it 'sets @stormy? to false if Weather object initalized with number < 90' do
    allow(subject).to receive(:number) { 32 }
    expect(subject.stormy).to eq(false)
  end
end
