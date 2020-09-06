require 'airport'
require 'plane'
describe Airport do

  it { is_expected.to respond_to(:land_plane) }

  it { is_expected.to respond_to(:local_weather) }

  it { is_expected.to respond_to(:set_weather) }

  it "should have an array of parked planes" do
    subject.local_weather = "sunny"
    expect(subject.land_plane).to be_an_instance_of(Array)
  
  end
  it "is expected to store landed planes with land_plane" do 
    subject.local_weather = "sunny"
    subject.land_plane 
    expect(subject.parked_planes[0]).to be_an_instance_of(Plane)
  end
  it "raises an error when capacity is full" do
    subject.local_weather = "sunny"
    expect { (Airport::DEFAULT_CAPACITY + 1).times { subject.land_plane } }.to raise_error "airport is full"
  end 
  it "does not raise an error when airport has one space left " do
    subject.local_weather = "sunny"
    expect { Airport::DEFAULT_CAPACITY.times { subject.land_plane } }.not_to raise_error 
  end
  it "allows you to set the capacity of the aiport" do
    expect(Airport.new(10).capacity).to eq 10
  end

  it { is_expected.to respond_to(:take_off) }

  it "it is expected to release stored plane with #take_off" do
    subject.local_weather = "sunny"
    subject.land_plane
    subject.take_off
    expect(subject.parked_planes.empty?).to eq true
  end

  it "should have a weather value" do
    expect(Airport.new.local_weather).not_to eq nil
  end
  
  it "#weather should return stormy when rand is stubbed to 9" do
    allow(subject).to receive(:rand) { 9 }
    expect(subject.set_weather).to eq "stormy"
  end

  it "#weather should return sunny when rand is stubbed to 6" do
    allow(subject).to receive(:rand) { 6 }
    expect(subject.set_weather).to eq "sunny"
  end

  it "should raise an error when trying to take off in a storm" do
    subject.local_weather = "stormy"
    subject.parked_planes << Plane.new
    expect { subject.take_off }.to raise_error "weather conditions too poor" 
  end

  it "should allow planes to take off in sunny weather" do
    subject.local_weather = "sunny"
    subject.parked_planes << Plane.new
    expect { subject.take_off }.not_to raise_error
    expect(subject.parked_planes.empty?).to eq true
  end

  it "should not allow planes to land in a storm" do
    subject.local_weather = "stormy"
    expect { subject.land_plane }. to raise_error "weather conditions too poor"
  end

  it "should allow planes to land in good weather" do
    subject.local_weather = "sunny"
    expect { subject.land_plane }.not_to raise_error 
  end
end
