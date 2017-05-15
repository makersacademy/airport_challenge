require 'plane'

describe Plane do

  it { is_expected.to respond_to :land_at }
  it { is_expected.to respond_to :depart_from }

  it 'lands' do
    airport = double(:airport, capacity:20, planes: [], weather: "calm", airport_name: airport)
    expect(subject.land_at(airport)).to eq subject
  end

  it 'departs' do
    airport = double(:airport, capacity:20, planes: [], weather: "calm", airport_name: airport)
    subject.land_at(airport)
    expect(subject.depart_from(airport)).to eq subject
  end

  it 'will not land if there is a storm' do
    airport = double(:airport, capacity:20, planes: [], weather: "storm", airport_name: airport)
    expect { subject.land_at(airport) }.to raise_error "Looks like I picked the wrong week to quit sniffing glue..."
  end

  it 'will not take off if there is a storm' do
    airport = double(:airport, capacity:20, planes: [subject], weather: "storm", airport_name: airport,)
    expect { subject.depart_from(airport) }.to raise_error "We can't take off in a storm"
  end

  it 'will not land if there is no space' do
    airport = double(:airport, capacity:1, planes: [], weather: "calm", airport_name: airport)
    subject.land_at(airport)
    expect { subject.land_at(airport) }.to raise_error "There's no space to land"
  end

  it 'cannot take off from an airport where it is not present...' do
    airport = double(:airport, capacity:20, planes: [], weather: "calm", airport_name: airport)
    expect { subject.depart_from(airport) }.to raise_error "This plane isn't at this airport"
  end

  it 'initializes as flying' do
    expect(Plane.new.flying).to eq "flying"
  end

  it 'can switch between flying and landed' do
    airport = double(:airport, capacity:20, planes: [], weather: "calm", airport_name: airport)
    expect(Plane.new.land_at(airport).flying).to eq "landed"
  end

  it 'sets itself to "landed" upon landing' do
    airport = double(:airport, capacity:20, planes: [], weather: "calm", airport_name: airport)
    expect(Plane.new.land_at(airport).flying).to eq "landed"
  end

  it "records when it lands" do
    plane = Plane.new
    airport = double(:airport, capacity:20, planes: [], weather: "calm", airport_name: airport)
    plane.land_at(airport)
    expect(airport.planes[0]).to eq plane
  end

  it 'sets itself to "flying" upon taking off' do
    airport = double(:airport, capacity:20, planes: [], weather: "calm", airport_name: airport)
    plane = Plane.new.land_at(airport)
    expect(plane.depart_from(airport).flying).to eq "flying"
  end

  it "records when it departs" do
    plane = Plane.new
    airport = double(:airport, capacity:20, planes: [], weather: "calm", airport_name: airport)
    plane.land_at(airport)
    plane.depart_from(airport)
    expect(airport.planes).not_to include(plane)
  end

  it 'cannot land if it has already landed' do
    airport = double(:airport, capacity:20, planes: [], weather: "calm", airport_name: airport)
    plane = Plane.new.land_at(airport)
    expect { plane.land_at(airport) }.to raise_error "This plane is already landed"
  end

  it "can fly from one airport to another" do
    airport1 = double(:airport, capacity:20, planes: [], weather: "calm", airport_name: airport1)
    airport2 = double(:airport, capacity:20, planes: [], weather: "calm", airport_name: airport2)
    subject.land_at(airport1)
    subject.flight_path(airport1, airport2)
    expect(airport2.planes[0]).to eq subject
  end

end
