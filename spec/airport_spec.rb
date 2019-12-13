require 'airport'

describe Airport do

  it 'creates an instance of Airport' do
  my_airport = Airport.new
  expect(my_airport).to be_instance_of Airport
  end

  it { is_expected.to respond_to :land_plane }

  it 'lands a plane' do
    my_plane = Plane.new
    expect(subject.land_plane(my_plane)).to eq my_plane
  end

end
