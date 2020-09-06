require 'airport.rb'
require 'plane.rb'

plane = Plane.new

describe Airport do
  ## Landing 
  it 'Should respond to #add_plane' do
    expect(subject).to respond_to(:add_plane)
  end

  it 'Should increase the number of @planes by 1 on landing' do
    expect { subject.add_plane }.to change { subject.planes.length }.by(1)
  end

  it 'Should increase the number of @plane by 1 using the Plane class #land method' do
    expect { plane.land(subject) }.to change { subject.planes.length }.by(1)
  end

=begin
  it 'Should prevent landing if the airport is full' do
    expect { subject.add_plane }.to raise_error('The hangar is full.')
    Airport::DEFAULT_CAPACITY.times { subject.add_plane }
  end
=end


  ## Takeoff
  it 'Should allow a plane to #remove_plane' do
    expect(subject).to respond_to(:remove_plane)
  end

  it 'Should decrease the number of @planes by 1 on takeoff' do
    subject.add_plane
    expect { subject.remove_plane }.to change { subject.planes.length }.by(-1)
  end

end