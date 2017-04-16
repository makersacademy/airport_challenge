require 'plane'
require 'airport'
require 'weather'

describe Plane do
  it { is_expected.to respond_to :land }

  it 'lands a plane when given the instruction land, if it is not stormy' do
    airport = Airport.new
    Weather.any_instance.stub(:rand_number).and_return(5)
    expect(subject.land(airport)).to eq airport.planes
  end

  it 'does not land a plane when given the instruction land if it is stormy' do
    airport = Airport.new
    Weather.any_instance.stub(:rand_number).and_return(9)
    expect { subject.land(airport) }.to raise_error "Too stormy, can't land"
  end

  it 'confirm that a plane has landed, if not stormy' do
    airport = Airport.new
    Weather.any_instance.stub(:rand_number).and_return(5)
    subject.land(airport)
    expect(subject.landed?(airport)).to eq true
  end

  it 'confirm that a plane has not landed if it has not' do
    airport = Airport.new
    Weather.any_instance.stub(:rand_number).and_return(5)
    expect(subject.landed?(airport)).to eq false
  end

  it { is_expected.to respond_to :take_off }

  it 'gets a plane to take off when given the instruction take_off, if not stormy' do
    airport = Airport.new
    Weather.any_instance.stub(:rand_number).and_return(5)
    subject.land(airport)
    subject.take_off(airport)
    expect(airport.planes).to eq []
  end

  it 'stops a plane from taking off when given the instruction take_off, if it is stormy' do
    airport = double("airport", :planes => ["plane"])
    Weather.any_instance.stub(:rand_number).and_return(9)
    expect { subject.take_off(airport) }.to raise_error "Too stormy, can't take off"
  end

  it 'confirm that a plane has taken off' do
    airport = Airport.new
    Weather.any_instance.stub(:rand_number).and_return(5)
    subject.take_off(airport)
    expect(subject.taken_off?(airport)).to eq true
  end

  it 'confirm that a plane has not taken off if it has not' do
    airport = Airport.new
    Weather.any_instance.stub(:rand_number).and_return(5)
    subject.land(airport)
    expect(subject.taken_off?(airport)).to eq false
  end

end
