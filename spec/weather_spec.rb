require 'weather'
describe Weather do
  it { is_expected.to respond_to :stormy? }
end

describe '#stormy?' do
  it 'returns true if storm_level is more than 7' do
    storm_level = Weather.new(storm_level: 8)
    expect(storm_level.stormy?).to eql(true)
  end

  it 'returns false if storm_level is 6 or less' do
    storm_level = Weather.new(storm_level: 6)
    expect(storm_level.stormy?).to eql(false)
  end
end
