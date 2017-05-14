require 'plane'

describe Plane do

  it { is_expected.to respond_to :land_at }
  it { is_expected.to respond_to :depart_from }

  it 'lands' do
    expect(subject.land_at(Airport.new)).to eq subject
  end

  it 'departs' do
    airport = Airport.new
    subject.land_at(airport)
    expect(subject.depart_from(airport)).to eq subject
  end

  it 'will not land if there is a storm' do
    airport = Airport.new.storm_switch
    expect{subject.land_at(airport)}.to raise_error "I picked the wrong week to stop sniffing glue..."
  end

  it 'will not take off if there is a storm' do
    airport = Airport.new
    subject.land_at(airport)
    airport.storm_switch
    expect{subject.depart_from(airport)}.to raise_error "We can't take off in a storm"
  end

  it 'will not land if there is no space' do
    airport = Airport.new(:capacity => 1)
    subject.land_at(airport)
    expect{subject.land_at(airport)}.to raise_error "There's no space to land"
  end

  it 'cannot take off from an airport where it is not present...' do
    airport = Airport.new
    expect{subject.depart_from(airport)}.to raise_error "This plane isn't at this airport"
  end

end
