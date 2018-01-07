require 'weather'

describe Weather do
  it 'can create an instance of the Weather class' do
    expect(subject).to be_instance_of(Weather)
  end

  context 'with randomness stubbed' do
    it 'can report stormy conditions' do
      allow(subject).to receive(:rand) {0}
      expect(subject.stormy?).to be true
    end

    it 'can report clear conditions' do
      allow(subject).to receive(:rand) {1}
      expect(subject.stormy?).to be false
    end
  end
end
