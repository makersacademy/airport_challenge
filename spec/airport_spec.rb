require 'airport'
describe Airport do
  it { is_expected.to respond_to(:land_plane) }

  describe Airport.new.land_plane do
  it { is_expected.to be_an_instance_of(Array) }
  
  end
  it "is expected to store landed planes with land_plane" do 
    y = Airport.new
    y.land_plane 
    expect(y.parked_planes[0]).to be_an_instance_of(Plane)
  end
  it "raises an error when capacity is full" do
    expect { (Airport::DEFAULT_CAPACITY + 1).times { subject.land_plane } }.to raise_error "airport is full"
  end 
  it "does not raise an error when plane has one space left " do
    expect { Airport::DEFAULT_CAPACITY.times { subject.land_plane } }.not_to raise_error 
  end
  it "allows you to set the capacity of the aiport" do
    expect(Airport.new(10).capacity).to eq 10
  end

  it { is_expected.to respond_to(:take_off) }

  it "it is expected to release stored plane with#take_off" do
    x = Airport.new
    x.land_plane
    x.take_off
    expect(x.parked_planes.empty?).to eq true
  end

end

