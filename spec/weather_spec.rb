require 'weather'

describe Weather do
  it 'it is stormy' do
    allow(subject).to receive(:rand) {1}
    subject.stormy?
    expect(subject.storm).to eq true
  end

  it 'it is not stormy' do
    allow(subject).to receive(:rand) {1}
    subject.stormy?
    expect(subject.storm).to eq true
  end
end
