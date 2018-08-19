require 'weather'

describe Weather do
  it 'stormy? is false' do
    expect(subject).to receive(:rand) { 50 }
    expect(subject.stormy?).to eq false
  end

    it 'stormy? is true' do
      expect(subject).to receive(:rand) { 1 }
      expect(subject.stormy?).to eq true
  end
end
