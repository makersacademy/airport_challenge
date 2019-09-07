require 'airport'

describe Airport do
  it 'holds a landed plane' do
    plane = double("plane")
    weather = double("weather", :current_conditions => "sunny")
    subject.land(plane, weather)
    expect(subject.planes).to eq [plane]
  end

  it 'allows a plane to takeoff' do
    plane = double("plane")
    weather = double("weather", :current_conditions => "sunny")
    subject.land(plane, weather)
    expect(subject.takeoff(plane, weather)).to eq plane
  end

  it 'prevents takeoff if weather is stormy' do
    plane = double("plane")
    weather = double("weather", :current_conditions => "stormy")
    expect { subject.takeoff(plane, weather) }.to raise_error("Weather is stormy: permission to takeoff denied")
  end

  it 'prevents landing if weather is stormy' do
    plane = double("plane")
    weather = double("weather", :current_conditions => "stormy")
    expect { subject.land(plane, weather) }.to raise_error("Weather is stormy: permission to land denied")
  end

  it 'prevents landing when airport is full' do
    plane = double("plane")
    weather = double("weather", :current_conditions => "sunny")
    Airport::DEFAULT_CAPACITY.times { subject.land(plane, weather) }
    expect { subject.land(plane, weather) }.to raise_error("Airport is full, unable to land plane")
  end

  it 'has a default capacity of 10' do
      plane = double("plane")
      weather = double("weather", :current_conditions => "sunny")
      Airport::DEFAULT_CAPACITY.times { subject.land(plane, weather) }
      expect { subject.land(plane, weather) }.to raise_error("Airport is full, unable to land plane")
  end

  it 'has a capacity of 20 when specified' do
      plane = double("plane")
      weather = double("weather", :current_conditions => "sunny")
      airport = Airport.new(20)
      20.times { airport.land(plane, weather) }
      expect { airport.land(plane, weather) }.to raise_error("Airport is full, unable to land plane")
  end
end
