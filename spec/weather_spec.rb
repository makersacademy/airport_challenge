require_relative '../docs/weather.rb'

describe Weather do
  it 'responds to .generate' do
    weather = Weather.new
    expect(weather).to respond_to(:generate)
  end
end
