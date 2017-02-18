require 'airport'

describe Airport do

  it 'confirms plane has landed' do
    plane = Plane.new
    expect { subject.land(plane) }.to output("#{plane} has landed").to_stdout
  end

end
