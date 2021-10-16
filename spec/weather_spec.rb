require_relative '../lib/weather'
subject = Weather.new
describe Weather do
  it "should initialse state as not stormy" do
    expect(subject.state).to eq(WEATHER_STATES[:not_stormy])
  end
  it 'should confirmed updated state' do
    subject.update_state(WEATHER_STATES[:stormy])
    expect(subject.state).to eq(WEATHER_STATES[:stormy])
  end
end
