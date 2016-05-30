require 'plane'

describe Plane do

  it { is_expected.to respond_to(:may_i_land?).with(1).argument }
  it { is_expected.to respond_to(:may_i_take_off?).with(1).argument }
  
  it { is_expected.to respond_to :landed? }
  it { is_expected.to respond_to :took_off? }

  describe '#may_i_land' do 
    it "permission to land" do
      expect(subject.may_i_land?(true)).to eq true
      expect(subject.may_i_land?(false)).to eq false
    end

    it 'checks if the plane has landed?' do
      subject.may_i_land?(true)
      expect(subject.landed?).to eq true
    end
  end

  describe '#may_i_take_off' do 
    it 'permission to take off' do
      expect(subject.may_i_take_off?(true)).to eq true
      expect(subject.may_i_take_off?(false)).to eq false
    end

    it 'has took off?' do
      subject.may_i_take_off?(true)
      expect(subject.took_off?).to eq true
    end
  end
end