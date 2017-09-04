# spec/weather_spec.rb

require 'weather'

RSpec.describe Weather do
  subject(:weather) { described_class.new }

  describe '#initialization' do
    it 'generate a weather' do
      expect(subject.stormy?).to eq(true).or eq(false)
    end
  end
end
