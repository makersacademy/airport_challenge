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
    expect(subject.hangar.empty?).to eq true 
  end
  
  it 'raises an error if we try to take off a plane but the hangar is empty' do
    expect{subject.take_off}.to raise_error "hangar is empty"
  end

# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when the airport is full 
  it 'avoids planes from landing if the hangar is full' do
    Airport::DEFAULT_CAPACITY.times{subject.land(plane)}
    expect{ subject.land(plane) }.to raise_error "hangar is full"
  end
  
  # As the system designer
  # So that the software can be used for many different airports
  # I would like a default airport capacity that can be overridden as appropriate
  describe 'Airports with different capacities'do
    subject{Airport.new(capacity)}
    let(:capacity) {15}
    it 'tests a new airport with a capacity of 15' do
      15.times{subject.land(plane)}
      expect{ subject.land(plane) }.to raise_error "hangar is full"
    end
  end

# As an air traffic controller 
# To ensure safety 
# I want to prevent takeoff when weather is stormy 
  it 'keeps planes grounded during a storm' do
    subject.land(plane)
    allow(subject).to receive(:stormy?){true}
    expect{subject.take_off}.to raise_error "grounded due to storm"
  end
  
  # As an air traffic controller 
  # To ensure safety 
  # I want to prevent landing when weather is stormy 
  it 'avoids planes from landing when stormy' do
    allow(subject).to receive(:stormy?){true}
    expect{ subject.land(plane)}.to raise_error "Cannot land due to storm"
  end

end
