require 'airport'
require 'planes'
require 'air_traffic_control'

describe Airport do
  let(:plane1){double(:plane)}
  let(:plane2){double(:plane)}
  
  it 'instantiates with a default capacity value of 4' do
    expect(subject.capacity).to eq 4
  end

  it 'can be instantiated with an overriden capacity value' do
    sixer_airport = Airport.new(6)
    expect(sixer_airport.capacity).to eq 6
  end

  it 'knows it starts with 0 planes on the ground' do
    expect(subject.plane_count).to eq 0
  end

  it 'increases planes_in_port by 1 when a plane arrives' do
    subject.plane_arrives(plane1)
    expect(subject.plane_count).to eq 1
  end

  it 'decreases planes_in_port by 1 when a plane departs' do
    subject.plane_arrives(plane1)
    subject.plane_arrives(plane2)
    subject.plane_departs
    expect(subject.plane_count).to eq 1
  end

  it 'stores the specific plane instance from atc during landing process' do
    subject.plane_arrives(plane1)
    expect(subject.planes_in_port).to include plane1
  end

end
