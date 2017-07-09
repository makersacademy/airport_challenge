require 'airport'

describe Airport do

  it 'responds to landing instructions' do
    expect(subject).to respond_to :instruct_to_land
  end

  it 'release a new plane for take off' do
    plane = Plane.new
    expect(plane).to be_took_off
  end

  # it 'lands a plane' do
  #   plane = Plane.new
  #   weather_is_stormy = false
  #   expect(subject.instruct_to_land(plane)). to eq plane
  # end

  it 'prevents take off if weather is stormy' do
    plane = Plane.new
    weather_is_stormy = true
    expect{subject.instruct_to_take_off(plane)}.to raise_error 'Weather is stormy'
  end

  it 'prevents landing if weather is stormy' do
    plane = Plane.new
    weather_is_stormy = true
    expect{subject.instruct_to_land(plane)}.to raise_error 'Weather is stormy'
  end
end
