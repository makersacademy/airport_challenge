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
end





