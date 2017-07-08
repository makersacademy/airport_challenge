require 'weather'

class WeatherTest
  include Weather
end

describe WeatherTest do
  it { is_expected.to respond_to :stormy? }

  it 'is expected to be stormy on rare occasions' do
    rare = (0.01..0.1)
    stats = []
    100.times { stats << subject.stormy? }
    stormy_ratio = stats.select { |n| n == true }.count / stats.count.to_f
    expect(rare.include? stormy_ratio).to be true
  end
end
