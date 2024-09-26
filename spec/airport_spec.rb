require 'airport'
require 'plane'

RSpec.describe Airport do

  it 'creates an instance of an Airport' do
    expect(subject).not_to eq(nil)
  end
  it { is_expected.to respond_to :full }

  it 'has a default capacity of 50 airplanes' do 
    expect(subject.capacity).to eq(50)
  end

  it 'can store multiple planes in its garage' do 
    plane = double(:plane)
    allow(plane).to receive(:land_at) { true }
    airport = subject

    plane.land_at(airport)
    expect(airport.garage).to eq(1) 

    plane.land_at(airport)
    expect(airport.garage).to eq(2) 
  end
end
