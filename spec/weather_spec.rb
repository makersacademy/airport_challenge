require './lib/weather'

describe Weather do
  it { should respond_to(:storm?).with(1).argument }
  describe '#storm?' do
    it 'should return a random number 1 and 6' do
    expect(subject.storm?(6)).to eq true

    end
  end
end
