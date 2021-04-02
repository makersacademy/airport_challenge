require 'weather'

describe Weather do
  it 'can generate a weather object' do
    expect(subject).to be_instance_of(Weather)
  end

  it 'can respond to stormy' do
    expect(subject).to respond_to(:stormy?)
  end

  describe '#stormy?' do
    it 'can return true' do
      allow(subject).to receive(:stormy?) { true }
      expect(subject.stormy?).to eq(true)
    end

    it 'can return false' do
      allow(subject).to receive(:stormy?) { false }
      expect(subject.stormy?).to eq(false)
    end
  end
end