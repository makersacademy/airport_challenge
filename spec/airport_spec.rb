# tests I want for US 1 and US 2
# DONE
# successful instantiate airport
# successful airport.is_empty == true
# successful instantiate plane
# successful plane.is_in_airport == false

#TODO
# successful plane.land
# plane.land == plane_is_in_airport && airport_is_not_empty

# successful instantiate airport
require 'airport'
require 'plane'

describe Airport do
  it 'successfully instantiates' do
    expect(subject).to be_instance_of(Airport)
  end
  # successful airport.is_empty == true
  it 'starts empty' do
    expect(subject).to be_empty
  end

  it 'when plane lands, is no longer empty' do
    test_plane = Plane.new#.land
    subject.take_in_plane(test_plane)
    expect(subject).not_to be_empty

  end

  it 'when capacity is 1, landing a second plane fails' do
    first_plane = Plane.new
    second_plane = Plane.new
    subject.take_in_plane(first_plane)
    # errors need { block } syntax
    expect { subject.take_in_plane(second_plane) }.to raise_error 'full'
  end

  it 'cannot allow the same plane to simultaneously dock twice in one airport' do
    x = Airport.new(2)
    first_plane = Plane.new
    x.take_in_plane(first_plane)
    expect { x.take_in_plane(first_plane) }.to raise_error 'DOCKED ALREADY'
  end

  it 'cannot allow an self to take in a plane docked in another airport' do
    test_plane = Plane.new
    a1 = Airport.new
    a2 = Airport.new
    a1.take_in_plane(test_plane)
    expect {a2.take_in_plane(test_plane) }.to raise_error 'DOCKED ALREADY'
  end


end

# PROBLEM: it's posible to take_in_plane yet, for plane.landed? to be false
# plane.landed might be a redundant method.
# SOLUTION: removed redundant mthods in plane.rb
