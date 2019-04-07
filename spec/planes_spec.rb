require 'planes'

describe Planes do
  it { is_expected.to respond_to :land }

  describe '#land' do
    it "shows the plane has landed" do
      expect(subject.land).to eq true
    end
  end

  describe 'take_off' do
    it "shows plane has taken off" do
      expect(subject.take_off).to eq false
    end
  end

end
