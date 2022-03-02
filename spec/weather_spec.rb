require 'weather'

describe Weather do

  it 'returns an weather object' do
    expect(subject).to be_an_instance_of(Weather)
  end

  describe '#stormy?' do
    it { is_expected.to respond_to(:stormy?) }

    it 'returns true or false based on the weather' do
      expect(subject.stormy?).to be(true).or be(false)
    end
  end
end
