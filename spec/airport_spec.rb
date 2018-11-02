require 'airport'

describe 'Plane' do

  let(:plane) {Plane.new}

  it 'Creates a new plane' do
    expect(plane).to be_instance_of(Plane)
  end

  it 'Lands a plane' do
    expect(plane).to respond_to(:land)
  end

  it 'Lands the plane and conmfirms the plane is there' do
    expect(plane.land).to eq "Safely landed"
  end

end
