require 'airport'

describe Airport do
  it 'tells plane to land' do
    expect(subject.plane_land(Plane.new)).to eq(nil)
  end

  it 'tells plane to take off' do
    expect(subject.plane_take_off(Plane.new)).to eq(false)
  end

  it 'when stormy weather, plane cannot take off' do
    allow(subject).to receive(:weather_random) { 5 }
    expect { subject.plane_take_off(Plane.new) }.to raise_error "Bad weather, plane cannot take off"
  end

  it 'when stormy weather, plane cannot land' do
    allow(subject).to receive(:weather_random) { 5 }
    expect { subject.plane_land(Plane.new) }.to raise_error "Bad weather, plane cannot land"
  end
end
