require 'weather'

describe Weather do
  it 'creates weather' do
    expect(Weather.new).to be_a Weather
  end

  it 'expect weather to return a string' do
    expect(Weather.new.forecast.length).is_a? String
  end
end
