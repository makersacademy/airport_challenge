require 'airport'

describe Airport do
  describe 'method:new/initialize' do
    it 'has default capacity when created and contains no planes' do 
      expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
      expect(subject.planes).to eq([])  
    end
  end
  describe 'method:planes' do
    it {expect(subject).to respond_to(:planes).with(0).argument}
  end
  describe 'method:capacity' do
    it {expect(subject).to respond_to(:capacity).with(0).argument}
  end
  describe 'method:plane_landed' do
    it {expect(subject).to respond_to(:plane_landed).with(1).argument}
    it 'lands plane inside the airport' do
      plane = double(:plane_object)
      subject.plane_landed(plane)
      expect(subject.planes[0]).to eq(plane)
    end
  end 
  describe 'method:full?' do
    it {expect(subject).to respond_to(:full?).with(0).argument}   
    it 'returns false when airport is not at full capacity' do
      plane = double(:plane_object)
      subject.plane_landed(plane)
      expect(subject).not_to be_full      
    end
    it 'returns true when airport is at full capacity' do
      (subject.capacity - 1).times do
        plane = double(:plane_object)
        subject.plane_landed(plane)
      end
      expect(subject).not_to be_full  
        plane = double(:plane_object)
        subject.plane_landed(plane)
      expect(subject).to be_full        
    end 
  end
end





