require 'airport'

describe Airport do
  let(:plane) { double(:plane) }
  
  it {expect(subject).to be_a Airport}  
      
  describe 'landing' do
    
    it {expect(subject).to respond_to(:landed).with(1).argument}
    
    it 'returns string if plane has landed' do
      allow(subject).to receive(:weather) {:sunny}
      expect(subject.landed(plane)).to eq 'Plane has touched down!!'
    end
    
    it 'adds a plane to the airport' do
      allow(subject).to receive(:weather) {:sunny}
      subject.landed(plane)
      expect(subject.planes.count).to eq 1
    end
    
    it 'prevents landing if weather is stormy' do
      allow(subject).to receive(:weather) {:stormy}
      expect {subject.landed(plane)}.to raise_error "It is too stormy to land."
    end
  end
  
  describe 'Planes can leave airport' do
    it {expect(subject).to respond_to(:leave_gate)}
    
    it 'Removes a plane from the airport' do
      allow(subject).to receive(:weather) {:sunny}
      subject.landed(plane)
      expect(subject.leave_gate).to eq "Plane has taken off!!"
      expect(subject.planes[0]).to eq nil
    end
  end
  
  describe 'checks the weather before take off' do
    
    it 'prevents take off when stormy' do
      allow(subject).to receive(:weather) {:stormy}
      expect{subject.leave_gate}.to raise_error "It is too stormy to take off."
    end
  end
  
  describe 'has limited capacity for planes' do
    
    it 'raises an error if full' do
      allow(subject).to receive(:weather) {:sunny}
      15.times { subject.landed(plane) }
      expect {subject.landed(plane)}.to raise_error "Airport is full."
    end
    
    it 'can change capacity' do
      airport = Airport.new(40)
      allow(airport).to receive(:weather) {:sunny}
      40.times { airport.landed(plane) }
      expect { airport.landed(plane) }.to raise_error "Airport is full."
    end
  end
end