require 'airport'

describe Airport do

  it 'respondes to land and takes an argument(plane)' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it '#land stores an instance variable plane' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end

  it 'respondes to take_off and takes an argument' do
    expect(subject).to respond_to :take_off
  end



end
