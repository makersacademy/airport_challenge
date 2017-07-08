require 'weather'

describe Weather do
  subject(:weather) { described_class.new }
  it { is_expected.to respond_to(:storms?) }

  it 'return a value for weather forecast' do
    expect(weather.storms?).to be_a_kind_of(Integer)
  end
end
