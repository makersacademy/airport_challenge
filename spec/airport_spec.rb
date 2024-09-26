require_relative '../docs/airport'
require_relative '../docs/plane'

describe Airport do 
  describe 'should respond to land_plane w/ an argument' do
    it {is_expected.to respond_to(:land_plane).with(1).argument }
  end

  let(:plane) {double :plane}
  it 'should land something' do 
    expect(subject.land_plane(plane)).to be_a(Array)
  end 

  it 'should allow plane to take off' do 
    subject.land_plane(plane)
    expect(subject.take_off).to eq plane
  end 

  it 'should confirm plane is no longer in airport' do 
    subject.land_plane(plane)
    expect(subject.check_runway(plane)).to eq true
    subject.take_off
    expect(subject.check_runway(plane)).to eq false
  end 

  it 'should have default capacity of 10 planes' do 
    # airport = Airport.new(10)
    expect(subject.capacity).to eq 10
  end 

  it 'accepts a custom capacity (of 50 in this test)' do 
    airport = Airport.new(50)
    expect(airport.capacity).to eq 50
  end 

  it 'doesnt let land when full + raises an error' do 
    subject.capacity.times{subject.land_plane(plane)}
    expect{subject.land_plane(plane)}.to raise_error "Error, runway full"
  end 

end 