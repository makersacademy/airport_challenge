require 'weather'

describe Weather do
  it '#stormy?' do
    allow(subject).to receive(:stormy?) { true }
    expect(subject.stormy?).to eq true
  end
end
