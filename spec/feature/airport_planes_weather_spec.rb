require 'airport'
require 'plane'
require 'weather'

describe 'feature test' do
  let(:weather) { double(:weather) }
  let(:real_weather) { Weather.new }
  let(:lsx_airport) { Airport.new(weather, 'Los Santos International', 'LSX') } 
  let(:dhs_airport) { Airport.new(weather, 'Death Star Spaceport', 'DHS') } 
  let(:tiny_airport) { Airport.new(weather, "Tiny airport", 'TNY', 1) }
  let(:real_life_airport) { Airport.new(real_weather, "London Heathrow", 'LHR') }
  let(:plane) { Plane.new }
  let(:air_force_1) { Plane.new }
  let(:capacity_error_message) { Airport::CAPACITY_ERROR_MESSAGE }
  let(:bad_weather_message) { Plane::BAD_WEATHER_MESSAGE }
  let(:not_at_airport_message) { Plane::NOT_AT_AIRPORT_MESSAGE }
  let(:already_at_airport_message) { Plane::ALREADY_AT_AIRPORT_MESSAGE }
  let(:already_in_air_message) { Plane::ALREADY_IN_AIR_MESSAGE }
  let(:capacity_message) { Plane::CAPACITY_MESSAGE }

  it 'allows multiple planes to land and take off' do
    allow(weather).to receive(:stormy?).and_return(false)
    expect(plane.land(lsx_airport)).to eq("Plane landed at #{lsx_airport.name} (#{lsx_airport.code})")
    expect(air_force_1.land(lsx_airport)).to eq("Plane landed at #{lsx_airport.name} (#{lsx_airport.code})")
    expect(lsx_airport.planes).to include(air_force_1)
    expect(lsx_airport.planes).to include(plane)
    expect(plane.land(lsx_airport)).to eq(already_at_airport_message)
    expect(plane.take_off(dhs_airport)).to eq(not_at_airport_message)
    expect(plane.take_off(lsx_airport)).to eq("Plane took off from #{lsx_airport.name} (#{lsx_airport.code})")
    expect(lsx_airport.planes).not_to include(plane)
    expect(plane.take_off(lsx_airport)).to eq(already_in_air_message)
  end

  it 'disaster strikes when an airport gets over capacity' do
    allow(weather).to receive(:stormy?).and_return(false)
    expect(air_force_1.land(tiny_airport)).to eq("Plane landed at #{tiny_airport.name} (#{tiny_airport.code})")
    expect(plane.land(tiny_airport)).to eq(capacity_message)
    expect { tiny_airport.receive(plane) }.to raise_error(RuntimeError, capacity_error_message)
  end

  it 'weather takes a turn for the worse and a plane gets stuck in the air' do
    allow(weather).to receive(:stormy?).and_return(false)
    expect(air_force_1.land(lsx_airport)).to eq("Plane landed at #{lsx_airport.name} (#{lsx_airport.code})")
    allow(weather).to receive(:stormy?).and_return(true)
    expect(plane.land(lsx_airport)).to eq(bad_weather_message)
    allow(weather).to receive(:stormy?).and_return(false)
    expect(plane.land(lsx_airport)).to eq("Plane landed at #{lsx_airport.name} (#{lsx_airport.code})")
  end

  it "doesn't error when using the actual random weather class" do
    expect {
      plane.land(real_life_airport)
      air_force_1.land(real_life_airport)
      100.times { Plane.new.land(real_life_airport) }
      plane.take_off(real_life_airport)
      air_force_1.take_off(real_life_airport)
    }.not_to raise_error
  end
  
end
