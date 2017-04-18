require 'airport'

describe Airport do
  it 'plane lands in airport' do
    plane = []
    expect(subject.land(plane)).to eq plane << Plane.new
  end

  it 'plane to take off' do
    expect(subject.plane_take_off(Plane.new)).to eq "plane has taken off"
  end

  it 'airport is empty' do
    expect { subject.empty? }.to raise_error "Airport is empty"
  end

  it 'no flying during storms' do
    subject.stub(:rand_weather).and_return(1)
    expect { subject.take_off(Plane.new) }.to raise_error "Take-off denied due to storm"
  end

  it 'no landing during stoms' do
#    subject.land(Plane.new)
    expect { subject.to_land(Plane.new) }.to raise_error "No landing permitted during storm"
  end
end
