require 'weather'

describe Weather do
  it 'returns a boolean from a "stormy" method' do
    expect([true, false]).to include subject.stormy
  end

  it 'is "stormy" approximately 10% of the time' do
    storminess_array = []
    10_000.times { storminess_array << subject.stormy }
    proportion_stormy_times = storminess_array.count(true).to_f / storminess_array.count(false).to_f
    expect(proportion_stormy_times).to be_between(0.08, 0.12)
  end
end
