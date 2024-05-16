require 'airport.rb'
require 'plane.rb'
require 'weather'

plane = Plane.new
weather = Weather.new

describe Airport do
  ## Landing 
  it 'Should respond to #add_plane' do
    expect(subject).to respond_to(:add_plane)
  end

  it 'Should increase the number of @planes by 1 on landing' do
    expect { subject.add_plane }.to change { subject.planes.length }.by(1)
  end

  it 'Should increase the number of @plane by 1 using the Plane class #land method' do
    allow(weather).to receive(:weather_now?) { "sunny" }
    expect { plane.land(subject, weather) }.to change { subject.planes.length }.by(1)
  end

  ## Takeoff
  it 'Should allow a plane to #remove_plane' do
    expect(subject).to respond_to(:remove_plane)
  end

  it 'Should decrease the number of @planes by 1 on takeoff' do
    subject.add_plane
    expect { subject.remove_plane }.to change { subject.planes.length }.by(-1)
  end

end
