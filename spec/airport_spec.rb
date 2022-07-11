 
require '../lib/airport.rb'
require '../lib/plane.rb'

describe Airport do
  let(:airplane) {double :airplane, :landed= => false, landed?: false}
  let(:weather) {double :weather, :sunny= => true, sunny?: true}

 
  it "Land a plane at the airport and confirm" do
    subject.sunny = true
    allow(airplane).to receive(:landed).and_return(false)
    expect(subject.land_plane(airplane)).to include(airplane)
  end

  it "Land plane then take off" do
    subject.sunny = true
    allow(airplane).to receive(:landed).and_return(false)
    subject.land_plane(airplane)
    allow(airplane).to receive(:landed).and_return(true)
    expect(subject.takeoff_plane(airplane)).to eq airplane
  end

  it "Check plane is in sky and not landed" do
    subject.sunny = true
    allow(airplane).to receive(:landed).and_return(false)
    subject.land_plane(airplane)
    allow(airplane).to receive(:landed).and_return(true)
    subject.takeoff_plane(airplane)
    expect(airplane).to_not be_landed
  end

  it "Make sure plane that as taken off is not at the airport" do
    subject.sunny = true
    allow(airplane).to receive(:landed).and_return(false)
    subject.land_plane(airplane)
    allow(airplane).to receive(:landed).and_return(true)
    subject.takeoff_plane(airplane)
    expect(subject.airplanes).to_not include(airplane)
  end

  it "Prevent plane to take off if not sunny" do
    subject.sunny = true
    allow(airplane).to receive(:landed).and_return(false)
    subject.land_plane(airplane)
    subject.sunny = false
    error = "Weather Stormy cannot take off"
    expect{subject.takeoff_plane(airplane)}.to raise_error error
  end

  it "Prevent airplane to land if not sunny" do
    subject.sunny = false
    error =  "Can't land as weather is stormy"
    expect{subject.land_plane(airplane)}.to raise_error error
  end

  it "Raise an error if the airport is full" do
    subject.sunny = true
    allow(airplane).to receive(:landed).and_return(false)
    Airport::DEFAULT_CAPACITY.times { subject.land_plane(airplane) }
    expect{subject.land_plane(airplane)}.to raise_error "Airport is full"
  end

  it "Check to see if you can fill, remove then fill airport" do
    subject.sunny = true
    allow(airplane).to receive(:landed).and_return(false)
    Airport::DEFAULT_CAPACITY.times { subject.land_plane(airplane) }
    allow(airplane).to receive(:landed).and_return(true)
    subject.takeoff_plane(airplane)
    expect(subject.airplanes).to include(airplane)
  end

  it "Overwrite default airport capacity to 30" do
    expect(subject.capacity=30).to eq 30
  end

  it "Raise error if plane already in sky and try takeoff" do
    subject.sunny = true
    allow(airplane).to receive(:landed).and_return(false)
    error = "Airplane is already in the sky!"
    expect{subject.takeoff_plane(airplane)}.to raise_error error
  end

  it "Raise error if plane already tries to land when already at airport" do
    subject.sunny = true
    allow(airplane).to receive(:landed).and_return(false)
    subject.land_plane(airplane)
    allow(airplane).to receive(:landed).and_return(true)
    error = "Airplane is already here"
    expect{subject.land_plane(airplane)}.to raise_error error
  end

end