require 'airport'

describe Airport do

  let(:planes) { [] }
  let(:extra_plane) { Plane.new }

  it 'prevents landing when full' do
    20.times do
      plane = Plane.new
      planes << plane
      plane.land(subject)
    end
    expect { extra_plane.land(subject) }.to raise_error "airport full"
  end
  
  it 'capacity can be overridden as appropriate' do
    airport_capacity = 37
    subject.capacity = airport_capacity
    airport_capacity.times do
      plane = Plane.new
      planes << plane
      plane.land(subject)
    end
    expect { extra_plane.land(subject) }.to raise_error "airport full"
  end
  
end
