require 'weather'

describe Weather do
  it 'responds to #weather_now?' do
    expect(subject).to respond_to(:weather_now?)
  end

  # weather_now?
  it 'selects a condition from @weather' do
    expect(subject.weather).to include(subject.weather_now?)
  end

end