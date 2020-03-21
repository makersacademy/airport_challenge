require 'airport'

describe Airport do

  it 'instructs plane to land and confirms landing' do
    plane = Plane.new
    expect(subject.land(plane)).to eq true
  end

  it 'instructs plane to land' do
    expect(subject).to respond_to :land
  end

  it 'instructs plane to take off and confirms take off' do
    plane = Plane.new
    expect(subject.take_off(plane)).to eq true
  end

  it 'instructs plane to take off' do
    expect(subject).to respond_to :take_off
  end

end
