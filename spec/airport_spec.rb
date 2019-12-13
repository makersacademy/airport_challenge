require 'airport'

describe Airport do

  it 'creates an instance of Airport' do
  my_airport = Airport.new
  expect(my_airport).to be_instance_of Airport
  end

  it { is_expected.to respond_to :land_plane }

  it 'lands a plane' do
    my_plane = Plane.new
    expect(subject.land_plane(my_plane)).to eq [my_plane]
  end

  it 'Ensures the plane we land is at the airport' do
    plane = Plane.new
    subject.land_plane(plane)
    expect(subject.planes_airport).to include(plane)
  end

  it 'raises an error if the plane tries to land and the airport is full' do
      20.times do
      subject.land_plane(Plane.new)
    end
    expect { subject.land_plane Plane.new }.to raise_error 'The airport is full'
  end

  it { is_expected.to respond_to :take_off }

  it 'plane leaves the airport when it takes off' do
  plane = Plane.new
  subject.land_plane(plane)
  subject.take_off(plane)
  expect(subject.planes_airport).not_to include(plane)
  end

  it 'When plane takes off it gives message "In the air"' do
  my_plane = Plane.new
  expect(subject.take_off(my_plane)).to eq "In the air"
  end




end
