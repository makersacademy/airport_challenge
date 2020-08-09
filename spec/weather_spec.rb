require 'weather'

describe Weather do
  it 'can create an instance of weather' do
    weather = Weather.new
    expect(weather).to be_kind_of(Weather)
  end

  it { is_expected.to respond_to :generator }
  it { is_expected.to respond_to :condition }

  describe '#initialize' do
    it 'returns a number between 1 and 10' do
      expect(subject.generator).to be_between(1, 10)
    end
  end

  describe '#condition' do
    it 'returns a string' do
      expect(subject.condition).to be_a String
    end

    it 'returns a weather type' do
      allow(subject.condition).to receive(3) { "sunny" }
    end
  end
end
