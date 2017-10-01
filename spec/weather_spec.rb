require 'weather.rb'

describe Weather do

  it 'reports the current weather' do
    weather = %w(Stormy Sunny)
    expect(weather).to include(subject.current)
  end

end
