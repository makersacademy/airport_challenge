require 'plane'
require 'airport'

describe Plane do
    
  it { is_expected.to respond_to :land_at_airport }

  it { is_expected.to respond_to :take_off_from_airport }

  it 'confirms the plane is no longer in the airport once the plan takes off' do
    subject.take_off_from_airport
    subject.in_airport?
    expect(subject).not_to be_in_airport
    end 

  it 'raises error if it tries to land when airport is full' do
    airport = Airport.new
      airport.capacity.times do
      Plane.new.land_at_airport(airport)
      end
    expect { Plane.new.land_at_airport(airport) }.to raise_error "The airport is full"
  end 

  it 'allows planes to land at the airport' do
    airport = Airport.new
    subject.land_at_airport(airport)
    expect(airport.parked_planes).to eq [subject]
  end 

end 