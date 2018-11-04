require 'plane'

describe Plane do

  it { is_expected.to respond_to(:land).with(1).argument }

  it 'is possible to land a plane at a specific airport' do
    expect(subject.land('here').status).to eq 'here'
  end

  it 'is possible to order a plane to take off' do
    expect(subject.land('here').take_off.status).to eq 'flying'
  end

end
