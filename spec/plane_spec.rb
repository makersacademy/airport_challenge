require 'plane'

describe Plane do
  let(:airport) { double :airport }

  it 'creates an instance of plane' do
    expect(subject).to be_an_instance_of(Plane)
  end

  it 'should be flying until it has landed' do
    airport = Airport.new
    expect(subject.flying).to eq true
    airport.land_plane(subject)
    expect(subject.flying).to eq false
  end

  it 'should be grounded after landing, and until it takeoffs' do
    airport = Airport.new
    airport.land_plane(subject)
    expect(subject.flying).to eq false
    airport.take_off(subject)
    expect(subject.flying).to eq true
  end

  it 'should be in the terminal after landing' do
    airport = Airport.new
    airport.land_plane(subject)
    expect(airport.terminal).to eq [subject]
  end

  it 'should be in the terminal after landing (multiple planes)' do
    airport = Airport.new
    plane1 = Plane.new
    plane2 = Plane.new
    airport.land_plane(plane1)
    airport.land_plane(plane2)
    expect(airport.terminal).to eq [plane1, plane2]
  end

  # it 'should return an error if no such plane exists' do
    # airport = Airport.new
    # expect(airport.land_plane(nil)).to eq "no such plane exists"
  # end

end
