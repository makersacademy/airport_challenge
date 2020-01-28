require 'plane.rb'
require 'airport.rb'

describe Plane do

  before (:each) do
    @airport = Airport.new
    allow(@airport).to receive(:weather) { 'sunny' }
    @plane = Plane.new
  end

  it 'Planes should land at airports' do
    expect(@plane.land(@airport)).to eq('landing')
  end

  it 'Planes should only land at airports' do
    airport = 'not an airport'
    expect { subject.land(airport) }.to raise_error('invalid airport')
  end

  it 'Planes should take off from airports and return new location (sky)' do
    plane = Plane.new(@airport)
    expect(plane.take_off(@airport)).to eq('sky')
  end

  it 'Planes should only take off from the airport they are at' do
    airport_1 = Airport.new
    # allow(airport_1).to receive(:weather) { 'sunny' }
    @plane.land(@airport)
    expect { @plane.take_off(airport_1) }.to raise_error('invalid take off location')
  end

  it 'Planes can not take off if they are already in the sky' do
    expect { subject.take_off('sky') }.to raise_error('plane already in the air')
  end

  it 'Planes can not land if the airport is full' do
    airport = Airport.new(0)
    allow(airport).to receive(:weather) { 'sunny' }
    expect { @plane.land(airport) }.to raise_error('airport is full')
  end

  it 'Planes can not land if not in sky' do
    @plane.land(@airport)
    expect { @plane.land(@airport) }.to raise_error('plane already on land')
  end

  it 'Plane.take_off should raise_error if weather is stormy' do
    @plane.land(@airport)
    allow(@airport).to receive(:weather) { 'stormy' }
    expect { @plane.take_off(@airport) }.to raise_error('stormy weather')
  end

  it 'Plane.landing should raise_error if weather is stormy' do
    allow(@airport).to receive(:weather) { 'stormy' }
    expect { @plane.land(@airport) }.to raise_error('stormy weather')
  end

end
