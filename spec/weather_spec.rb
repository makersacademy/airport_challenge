require 'weather'

describe Weather do
  it 'can create an instance of the Weather class' do
    expect(subject).to be_instance_of(Weather)
  end

  context 'with randomness stubbed' do
    it 'reports stormy conditions' do
      allow(subject).to receive(:rand).and_return(0)
      expect(subject.stormy?).to be true
    end

    it 'reports clear conditions' do
      allow(subject).to receive(:rand).and_return(1)
      expect(subject.stormy?).to be false
    end
  end
end
