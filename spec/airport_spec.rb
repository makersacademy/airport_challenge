require 'airport'
# require 'plane'

describe Airport do

  plane = Plane.new

  it 'responds to land' do
    expect(subject).to respond_to :land
  end

  it 'responds to take_off' do
    expect(subject).to respond_to :take_off
  end

  it 'has landed planes?' do
    expect(subject.planes?)
  end

  it 'lands planes' do
    expect(subject.land(plane)).to eq ("plane has landed")
  end

  it 'takes off planes' do
    expect(subject.take_off(plane)).to eq("plane has taken off")
  end

end
