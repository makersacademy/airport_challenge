require 'plane.rb'

describe Plane do 

  it { is_expected.to respond_to(:land) } 

  describe '#land' do
    it 'lands a plane' do
      expect(subject.land).to eq(:landed)
    end

    it "raises error if already landed" do
      subject.land
      expect { subject.land }.to raise_error "Already landed"
    end
  end

  it { is_expected.to respond_to(:take_off) } 

  describe '#take_off' do
    it 'allows plane to take off' do
      expect(subject.take_off).to eq(:flying)
    end

    it "raises error if already flying" do
      subject.land
      subject.take_off
      expect { subject.take_off }.to raise_error "Already flying"
    end
  end
end
