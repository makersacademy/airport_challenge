require 'airport'

describe Airport do
  it 'Lands a plane and plane takes off again' do
    plane = Plane.new
    subject.land_plane(plane)
    expect(subject.landed_planes).to include(plane)
    subject.plane_take_off(plane)
    expect(subject.landed_planes).to be_empty
  end

  it "Three planes land, the second plane takes off then the weather changes so the other two can't" do
    3.times { subject.land_plane(Plane.new) }
    expect(subject.landed_planes.length).to eq 3
    subject.plane_take_off(subject.landed_planes[1])
    expect(subject.landed_planes.length).to eq 2
    subject.change_weather(false)
    expect { subject.plane_take_off(subject.landed_planes[0]) }.to raise_error(RuntimeError, 'Weather not acceptable')
    expect { subject.plane_take_off(subject.landed_planes[1]) }.to raise_error(RuntimeError, 'Weather not acceptable')
  end

end
