require 'airport'

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) { double(:plane) }
  
  it {expect(airport).to be_a Airport}  
      
  describe '#landed' do
#    before(:each) do
#      allow(airport).to receive(:weather)
#    end
    
    it 'returns string if plane has landed' do
      allow(airport).to receive(:weather) {:sunny}
      expect(airport.landed(plane)).to eq 'Plane has touched down!!'
    end
    
    it 'adds a plane to the airport' do
      allow(airport).to receive(:weather) {:sunny}
      airport.landed(plane)
      expect(airport.planes.count).to eq 1
    end
    
    it 'prevents landing if weather is stormy' do
      allow(airport).to receive(:weather) {:stormy}
      expect {airport.landed(plane)}.to raise_error "It is too stormy to land."
    end
  end
  
  describe '#leave_gate' do
    
    it 'Removes a plane from the airport' do
      allow(airport).to receive(:weather) {:sunny}
      airport.landed(plane)
      expect(airport.leave_gate).to eq "Plane has taken off!!"
      expect(airport.planes[0]).to eq nil
    end
  end
  
  describe '#weather' do
    
    it 'prevents take off when stormy' do
      allow(airport).to receive(:weather) {:stormy}
      expect{airport.leave_gate}.to raise_error "It is too stormy to take off."
    end
  end
  
  describe '#capacity' do
    
    it 'raises an error if full' do
      allow(airport).to receive(:weather) {:sunny}
      15.times { airport.landed(plane) }
      expect {airport.landed(plane)}.to raise_error "Airport is full."
    end
    
    it 'can change capacity' do
      airport = Airport.new(40)
      allow(airport).to receive(:weather) {:sunny}
      40.times { airport.landed(plane) }
      expect { airport.landed(plane) }.to raise_error "Airport is full."
    end
  end
end