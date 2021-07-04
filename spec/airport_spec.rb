require 'airport'

describe Airport do
  
  describe '#initialize' do
    it 'has a default capacity of 35' do
      expect(subject.capacity).to eq(35)
    end
  end


  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }
  end

  describe '#take_off' do
  it { is_expected.to respond_to(:take_off) }

  it 'releases planes' do
    plane = Plane.new
    subject.land(plane)
    plane = subject.take_off
    expect(plane).to eq(plane)
  end
end


end