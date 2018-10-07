require 'rspec'
require_relative '../weather'

describe Weather do
  subject(:weather){described_class.new}
  describe '#new' do
    it 'should create a new weather object' do
      expect(described_class).to eq(Weather)
    end
  end
  describe '#stormy?' do
    it 'should return a boolean if it is stormy or not' do
        expect(weather.stormy?).to be(true).or be(false)
      end
  end

end