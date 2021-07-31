require 'airport'

describe Airport do

  # test 1
  it "responds to plane take off method" do
    expect(subject).to respond_to('land')
  end

  # test 2
  it "lands planes" do
    my_plane = Plane.new
    subject.land(my_plane)
    expect(subject.plane).to eq my_plane

  end


end





# dan_bike = Bike.new
# subject.dock(dan_bike)
# expect(subject.bikes.last).to eq dan_bike