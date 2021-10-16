require_relative '../lib/weather'
subject = Weather.new
describe Weather do
  it 'should confirmed updated state' do
    subject.update_state(WEATHER_STATES[:stormy])
    expect(subject.state).to eq(WEATHER_STATES[:stormy])
  end
end
