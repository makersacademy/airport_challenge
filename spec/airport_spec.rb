require 'Airport'

describe Airport do 

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument}

  it 'allows a flying plane to land' do
    plane = Plane.new
    expect(subject.land(plane)).to eq "The plane has landed"
  end
  it 'allows a plane to take-off' do
  plane = Plane.new
  expect(subject.take_off(plane)).to eq "The plane has taken off"
  end
end






