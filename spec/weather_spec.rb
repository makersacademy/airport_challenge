require 'weather'

describe Weather do
  it 'can create an instance of weather' do
    weather = Weather.new
    expect(weather).to be_kind_of(Weather)
  end

  it { is_expected.to respond_to :weather }
  it { is_expected.to respond_to :conditions }

  describe '#initialize' do
    it 'returns a random weather value' do
      allow(Weather.new).to receive(:condition) { "stormy" }
    end
  end

  describe '#condition' do
    it 'is an array type' do
      expect(subject.conditions).to be_a Array
    end

    it 'always returns a string type' do
      index = rand(0..5)
      expect(subject.conditions[index]).to be_a String
    end
  end
end
