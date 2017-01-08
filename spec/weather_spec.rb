require 'weather'

describe Weather do
  it 'responds to the method check_weather' do
    expect(subject).to respond_to :check_weather
  end
end
