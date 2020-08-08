require 'airport'

describe Airport do
  it 'can create an instance of Airport' do
    airport = Airport.new
    expect(airport).to be_kind_of(Airport)
  end

  it { is_expected.to respond_to(:land).with(1).argument }

  it 'returns a plane that has landed' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end
  
end
