require 'airport'

describe Airport do

  let(:plane) { double(:plane) }
  let(:fine_weather) { double(:weather, :stormy => false) }
  let(:stormy_weather) { double(:weather, :stormy => true) }

  it 'allows planes to land at it if the weather is fine' do
    subject.land(plane, fine_weather)
    expect(subject.parked_planes[-1]).to eq plane
  end

  it 'does not allow planes to land if the weather is stormy' do
    expect{subject.land(plane, stormy_weather)}.to raise_error 'Too dangerous to land'
  end

  it 'allows planes to take off from it in fine weather' do
    subject.land(plane, fine_weather)
    subject.leave(plane, fine_weather)
    expect(subject.parked_planes).not_to include plane
  end

  it 'does not allow planes to take off from it in stormy weather' do
    subject.land(plane, fine_weather)
    expect{subject.leave(plane, stormy_weather)}.to raise_error 'Too dangerous to take off'
  end

  it 'allows air traffic controllers to check if a plane is parked at it' do
    subject.land(plane, fine_weather)
    expect(subject.check_for_plane plane).to eq true
    subject.leave(plane, fine_weather)
    expect(subject.check_for_plane plane).to eq false
  end

end
