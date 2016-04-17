require 'weather'

describe Weather do

  let(:groundplane) { double(:plane, land: true, takeoff: true, ground: true)}
  let(:flyplane) { double(:plane, land: true, takeoff: true, ground: false)}

  it 'raises an error when a plane tried to land and the weather is stormy' do
    allow(subject).to receive(:rand) {20}
    l_stormy = "Planes cannot land due to stormy weather"
    expect {subject.weather_calc(flyplane)}.to raise_error(l_stormy)
  end

  it 'raises an error when a plane tries to takeoff in stormy weather' do
    allow(subject).to receive(:rand) {20}
    t_stormy = "Planes cannot take off due to stormy weather"
    expect {subject.weather_calc(groundplane)}.to raise_error(t_stormy)
  end
end
