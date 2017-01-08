# /Users/shereen/Google Drive/Projects/airport_challenge/spec/airport_spec.rb

require "airport"

describe Airport do
  #1st story / 1st test
  it {is_expected.to respond_to :plane_landed?}

  #1st story / 3rd test
  it 'receives a plane' do
    plane = subject.plane_landed?
    # expect(plane).to be_confirm_landed?
    expect(plane).to respond_to :confirm_landed?
  end
end

describe Airport do
  #2nd story / 1st test
  it {is_expected.to respond_to :plane_take_off}
  #2nd story / 3rd test
  it { is_expected.to respond_to(:plane_take_off).with(1).argument }

  #2nd story / 5th test
  it 'returns an airborne plane' do
    plane = Plane.new
    expect(subject.plane_take_off(plane)).to eq plane
  end
end

describe Airport do
  #3rd story / 1st test
  it {is_expected.to respond_to :prevent_take_off}

  #3rd story / 2nd test
  it { is_expected.to respond_to(:prevent_take_off).with(1).argument }

  #3rd story / 3rd test
  it 'returns a grounded plane' do
    plane = Plane.new
    expect(subject.prevent_take_off(plane)).to eq plane
  end

  #3rd story / 4th test
  it {is_expected.to respond_to :weather}



  # it 'prevents takeoff when weather is stormy' do
  # expect { subject.plane_take_off(plane, weather) }.to raise_error 'Weather is stormy, you cannot take off'
  # # end







end
