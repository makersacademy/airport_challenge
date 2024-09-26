require 'weather'

describe Weather do
  it 'checks weather is working' do
    expect(subject).to respond_to(:working?)
  end

  it 'checks it returns a string' do
    subject.weather_forecast
    expect(subject.weather_forecast).to be_a_kind_of(String)
  end
end
