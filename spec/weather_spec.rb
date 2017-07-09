require 'weather'

describe Weather do
  subject(:weather) { described_class.new }
  it 'can be stormy' do
    expect(weather.stormy?).to be(true).or be(false)
  end
end
