require 'airport'

describe Airport do

  it 'confirms plane has landed' do
    plane = Plane.new
    expect { subject.land(plane) }.to output("#{plane} has landed").to_stdout
  end

  it 'confirms plane is no longer in airport' do
    plane = Plane.new
    expect { subject.take_off(plane) }.to output("#{plane} is no longer in airport").to_stdout
  end

end
