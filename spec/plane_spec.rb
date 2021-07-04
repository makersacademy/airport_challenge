require 'plane'

RSpec.describe Plane do
  
  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:take_off).with(1).argument }

  it { is_expected.to be_airborne }

  it 'confirms it is no longer in the airport' do
    airport = Airport.new
    subject.take_off(airport)
    expect(subject.take_off(airport)).to eq( "We have left the airport" )
  end

  it 'confirms it has landed' do
    airport = Airport.new
    subject.land(airport)
    expect(subject.land(airport)).to eq( "We have landed" )
  end


end