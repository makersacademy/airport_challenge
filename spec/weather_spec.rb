require 'weather'

describe Weather do
  subject(:weather) { described_class.new }
  it 'returns boolean value when created' do
    expect(weather.stormy).to be(true).or be(false)
  end
end
