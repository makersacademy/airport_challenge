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
end
