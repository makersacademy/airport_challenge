require 'weather'

describe Weather do
  it 'can create an instance of weather' do
    weather = Weather.new
    expect(weather).to be_kind_of(Weather)
  end

  it { is_expected.to respond_to :weather }
  it { is_expected.to respond_to :conditions }

  describe '#initialize' do
    it 'returns a number between 1 and 10' do
      expect(subject.weather).to be_between(1, 10)
    end
  end

  describe '#condition' do
    it 'returns a string' do
      expect(subject.conditions).to be_a Array
    end

    it 'returns a weather type' do
      expect(subject.conditions(1)).to eq ["sunny"]
    end

    it 'returns the stormy value when given 3' do
      allow(subject).to receive(:condition).with(3).and_return("stormy")
    end
  end
end
