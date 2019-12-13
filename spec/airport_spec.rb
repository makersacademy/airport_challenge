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

  it { is_expected.to respond_to :take_off }

  it 'Confirms the plane is no longer in the airport, gives message "In the air"' do
  my_plane = Plane.new
  expect(subject.take_off(my_plane)).to eq "In the air"
  end


end
