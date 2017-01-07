require 'weather'

describe Weather do
  it 'determines the current weather' do
    expect(subject).to respond_to :current_weather
  end

end
