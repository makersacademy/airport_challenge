require 'airport'

describe Airport do
  let(:plane) { double(:plane) }
    
  it {expect(subject).to be_a Airport}  
      
  describe 'landing' do
    let(:land_plane) { double(land:  subject.landed(self)) }
    
    it {expect(subject).to respond_to(:landed).with(1).argument}
    
    it 'returns string if plane has landed' do
      expect(subject.landed(land_plane)).to eq 'Plane has touched down!!'
    end
    
    it 'adds a plane to the airport' do
      subject.landed(plane)
      expect(subject.planes.length).to eq 1
    end
  end
  
  describe 'Planes can leave airport' do
    it {expect(subject).to respond_to(:leave_gate)}
    
    it 'Removes a plane from the airport' do
      subject.landed(plane)
      expect(subject.leave_gate).to eq "Plane has taken off!!"
      expect(subject.planes[0]).to eq nil
    end
  end
end