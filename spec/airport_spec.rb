require 'airport'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }

  it 'lands plane' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end

  it { is_expected.to respond_to :take_off }

  it 'releases planes for take off' do

    plane = subject.take_off
    expect(plane).to be_taken_off
  end
end
