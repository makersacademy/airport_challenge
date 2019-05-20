require 'weather'

describe 'weather' do

  before(:each) { srand(12_345) }

  let(:weather) { Weather.new }

  context 'when asked if if stormy' do
    it 'returns true (with constant seed)' do
      expect(weather.stormy?).to be true
    end
  end
end
