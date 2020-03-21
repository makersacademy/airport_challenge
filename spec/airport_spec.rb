require 'airport'

describe Airport do

  it 'instructs plane to land and confirms landing' do
    plane = Plane.new
    expect(subject.land(plane)).to eq true
  end

  it 'instructs plane to land' do
    expect(subject).to respond_to :land
  end

end
