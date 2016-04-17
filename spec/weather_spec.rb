require 'weather'

describe Weather do

  let(:groundplane) { double(:plane, land: true, takeoff: true, ground: true)}
  let(:flyplane) { double(:plane, land: true, takeoff: true, ground: false)}

  it 'raises an error when a plane tried to land and the weather is stormy' do
    allow(subject).to receive(:rand) {20}
    expect {subject.weather_calc(flyplane)}.to raise_error("Planes cannot land due to stormy weather")
  end

  it 'raises an error when a plane tries to takeoff and the weather is stormy' do
    allow(subject).to receive(:rand) {20}
    expect {subject.weather_calc(groundplane)}.to raise_error("Planes cannot take off due to stormy weather")
  end
end
