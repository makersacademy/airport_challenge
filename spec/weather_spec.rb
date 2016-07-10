require 'weather'

describe Weather do
subject(:weather) { Weather.new }

  it 'can be stormy' do
    expect(weather.weather).to include (:stormy)
  end

  it 'can be fine' do
    expect(weather.weather).to include (:fine)
  end




end
