require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  it 'is either stormy or not stormy' do
    expect(weather.is_stormy?).to be(true).or be(false)
  end
end
