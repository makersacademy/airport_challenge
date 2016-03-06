require 'plane.rb'

describe Plane do

  describe '#land' do
    it { is_expected.to respond_to :land }

    it "Cannot land when it has already landed" do
      subject.land
      expect { subject.land }.to raise_error "This plane has already landed"
    end
  end

  describe '#landed' do
    it { is_expected.to respond_to :landed }
    it 'Should tell you when a plane has landed' do
      subject.land
      expect(subject.landed).to eq true
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to :take_off }

    it 'Should tell you when a plane has taken off' do
      subject.land
      subject.take_off
      expect(subject.landed).to eq false
    end

    it "Cannot take off when it has already taken off" do
      expect { subject.take_off }.to raise_error "This plane is not in the airport"
    end
  end

end
