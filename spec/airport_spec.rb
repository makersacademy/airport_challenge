require 'airport'

describe Airport do
  it 'prevents landing when full' do
    planes = []
    20.times do
      plane = Plane.new
      planes << plane
      plane.land(subject)
    end
    extra_plane = Plane.new
    expect { extra_plane.land(subject) }.to raise_error "airport full"
  end
  it 'capacity can be overridden as appropriate' do
    airport_capacity = 37
    subject.capacity = airport_capacity
    planes = []
    airport_capacity.times do
      plane = Plane.new
      planes << plane
      plane.land(subject)
    end
    extra_plane = Plane.new
    expect { extra_plane.land(subject) }.to raise_error "airport full"
  end
  it 'will prevent takeoff when the weather is stormy' do
    weather = double("weather")
    allow(weather).to receive(:state) { "stormy" }
    
  end
end
