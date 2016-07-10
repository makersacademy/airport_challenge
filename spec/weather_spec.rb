require 'weather'

describe Weather do
  it '.report generates weather report.' do
    expect(Weather::FORECAST).to include(Weather.report)
  end
end
