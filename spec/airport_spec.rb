require 'airport'

describe Airport do 
  let(:plane) { double :plane, class: Plane }

  describe '#land' do

    it 'can instruct plane to land' do
      subject.land plane
      expect(subject.planes.include? plane).to eq true
    end

  end

  describe '#takeoff' do
  
    it 'can instruct plane to take off' do
      subject.land plane
      subject.takeoff plane
      expect(subject.planes.include? plane).to eq false
    end

  end

  describe '#contain' do

    it 'can confirm contains plane' do
      subject.land plane
      expect(subject.contain? plane).to eq true
    end

    it "can confirm does not contain plane" do
      expect(subject.contain? plane).to eq false
    end
  
  end

end
