require 'plane'

describe Plane do

  before(:each) { Plane.class_variable_set :@@next_flight_id, 1 }

  it 'default initialization is in flight' do
    default_plane = Plane.new
    expect(default_plane.in_flight).to eq true
  end

  it 'can be initialized in an airport' do
    heathrow = double("heathrow", :land_plane => nil)
    heathrow_plane = Plane.new({:airport => heathrow})
    expect(heathrow_plane.in_flight).to eq false
    heathrow = double("heathrow", :planes => [heathrow_plane])
    expect(heathrow.planes).to eq [heathrow_plane]
  end

  it 'is initialized with default flight number' do
    default_plane = Plane.new
    expect(default_plane.flight_id).to eq 1
  end

  it 'The second default plane initialized has default flight number of 2' do
    Plane.new
    default_plane2 = Plane.new
    expect(default_plane2.flight_id).to eq 2
  end

  it 'Lands after being cleared to land' do
    heathrow = double("heathrow", :land_plane => nil)
    subject.cleared_to_land(heathrow)
    expect(subject.in_flight).to eq false
  end

  it 'Plane takes off and is in flight after being cleared for take off' do
    heathrow = double("heathrow", :land_plane => nil, :plane_departed => nil)
    subject.cleared_to_land(heathrow)
    subject.cleared_for_take_off(heathrow)
    expect(subject.in_flight).to eq true
  end

  it 'Planes do not land if they are are not in flight' do
    heathrow = double('Airport', :land_plane => nil)
    subject.cleared_to_land(heathrow)
    expect { subject.cleared_to_land(heathrow) }.to raise_error("Plane already landed!")
  end

  it 'Planes do not take off if they are are in flight' do
    heathrow = double('Airport')
    expect { subject.cleared_for_take_off(heathrow) }.to raise_error("Plane already in flight!")
  end

end
