require_relative '../lib/weather.rb'

describe Weather do

  subject(:weather) { described_class.new }

  it { is_expected.to respond_to(:stormy?)}

  it 'should return true when weather is stormy' do
    subject.weather_condition = :stormy
    expect(subject).to be_stormy
  end

  it 'should return false when weather is sunny' do
    subject.weather_condition = :sunny
    expect(subject).not_to be_stormy
  end

end
