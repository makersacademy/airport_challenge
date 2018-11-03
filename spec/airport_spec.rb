require 'airport'
require 'plane'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  let(:weather) {Weather.new}

  it { is_expected.to respond_to(:instruct_plane_land) }
  it { is_expected.to respond_to(:instruct_plane_take_off) }

  it 'instructs plane to land and confirms it landed' do
    allow(subject).to receive(:bad_weather?) { false }
    expect(airport.instruct_plane_land(plane)).to eq "#{plane} has landed"
  end

  it 'instructs plane to take off and confirms plane has left airport' do
    allow(subject).to receive(:bad_weather?) { false }
    airport.instruct_plane_land(plane)
    expect(airport.instruct_plane_take_off(plane)).to eq "#{plane} has left airport"
  end

  it 'plane cannot land if hangar is already full' do
    allow(subject).to receive(:full?) { true }
    15.times { airport.instruct_plane_land(plane) }
    expect{ airport.instruct_plane_land(plane)}.to raise_error "Hangar is full, #{plane} not able to land"
  end

  it 'Will prevent takeoff when weather is stormy' do
    allow(subject).to receive(:bad_weather?) { true }
    airport.instruct_plane_land(plane)
    expect{ airport.instruct_plane_take_off(plane)}.to raise_error "Weather is not good, #{plane} cannot take off"
  end

end
