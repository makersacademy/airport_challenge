require 'plane'

describe Plane do
  it 'when reading location of a plane' do
    expect(subject).to respond_to :location
  end

  it 'while "in transit" planes attempt to take off' do
    expect{subject.flight_check}.to raise_error "cannot take off while plane is in transit"
  end

  it 'while setting location' do
    subject.change_location("heathrow")
    expect(subject.location).to eq "heathrow"
  end

  it 'while "grounded" planes attempt to land' do
    subject.location = "grounded"
    expect{subject.landing_check}.to raise_error "cannot land a plane which is already grounded"
  end
end