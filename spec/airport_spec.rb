require_relative '../lib/airport'

describe Airport do
let(:plane) { double :plane}

# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport
  it 'lands an airplane' do 
    expect(subject).to respond_to ('land')
    expect(subject.land(plane)).to_not eq nil
  end
  
  # As an air traffic controller 
  # So I can get passengers on the way to their destination 
  # I want to instruct a plane to take off from an 
  # airport and confirm that it is no longer in the airport
  it 'instructs a plane to take off' do
    subject.land(plane)
    expect(subject).to respond_to ('take_off')
    expect(subject.take_off).to_not eq nil 
  end

end
