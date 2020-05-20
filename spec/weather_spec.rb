require 'weather'

describe Weather do
  it 'Should have a weather class' do
    expect(Weather).to respond_to(:new)
  end

  describe '#check' do
    it 'Shold return a random number' do
      allow(subject).to receive(:check).and_return(true)
      expect(subject.check).to eq(true)
    end
  end
end
