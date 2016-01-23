require 'airport'

describe Airport do
  let(:plane) { double(:plane) }
    
  it {expect(subject).to be_a Airport}  
      
  describe 'landing' do
    let(:land_plane) { double(land:  subject.landed(self)) }
    
    it {expect(subject).to respond_to(:landed).with(1).argument}
    
    it 'returns string if plane has landed' do
      allow(subject).to receive(:weather) {"Sunny"}
      expect(subject.landed(land_plane)).to eq 'Plane has touched down!!'
    end
    
    it 'adds a plane to the airport' do
      allow(subject).to receive(:weather) {"Sunny"}
      subject.landed(plane)
      expect(subject.planes.length).to eq 1
    end
    
    it 'prevents landing if weather is stormy' do
      allow(subject).to receive(:weather) {"Stormy"}
      expect {subject.landed(plane)}.to raise_error "It is too stormy to land now. You will have to fly around a little longer"
    end
  end
  
  describe 'Planes can leave airport' do
    it {expect(subject).to respond_to(:leave_gate)}
    
    it 'Removes a plane from the airport' do
      allow(subject).to receive(:weather) {"Sunny"}
      subject.landed(plane)
      expect(subject.leave_gate).to eq "Plane has taken off!!"
      expect(subject.planes[0]).to eq nil
    end
  end
  
  describe 'checks the weather before take off' do
    
    it 'prevents take off when stormy' do
      allow(subject).to receive(:weather) {"Stormy"}
      expect{subject.leave_gate}.to raise_error "It is too stormy to take off now. Wait until it is calmer"
    end
  end
end