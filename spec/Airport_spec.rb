require 'Airport'
require 'Plane'
# require 'Weather'

describe Airport do

  let(:plane) { Plane.new }

  before do
    allow(subject).to receive(:stormy?).and_return false
  end

  # test for prevent_mid_air_takeo_ff
  it 'should prevent takeoff due to plane in air' do
    expect { subject.take_off(plane) }.to raise_error "Plane is already in the air, over"
  end

  # test for prevent_landed_planes_landing
  it 'should prevent landed planes landing again' do
    red_plane = Plane.new
    subject.land_plane(red_plane)
    expect { subject.land_plane(red_plane) }.to raise_error "Plane has already landed, over"
  end

  # test for land_plane
  it 'should instruct plane to land (with safe weather)' do
    expect(subject.land_plane(plane)).to eq "Plane is clear to land, over"
  end
  # test for full?
  it 'plane cannot land due to too many planes in airport (with safe weather)' do
    5.times { subject.land_plane(Plane.new) }
    expect { subject.land_plane(Plane.new) }.to raise_error "Aiport is full, over"
  end

  # test for take_off
  it 'should instruct a plane to take off' do
    subject.land_plane(plane)
    expect(subject.take_off(plane)).to eq "Plane can proceed to runway and takeoff, over"
  end

  # test for stormy?
  it 'should prevent a plane landing due to weather' do
    allow(subject).to receive(:stormy?).and_return true
    expect { subject.land_plane(plane) }.to raise_error "Weather is preventing this, over"
  end

end
