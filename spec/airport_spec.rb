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

  it 'returns an airborne plane' do
    plane = Plane.new
    expect(subject.plane_take_off(plane)).to eq plane
  end



end
