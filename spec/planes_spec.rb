require 'planes'

describe Planes do
  it { is_expected.to respond_to :flying }

  describe '#landed' do
    it "shows the plane has landed" do
      expect(subject.landed).to eq false
    end
  end

  describe '#taken_off' do
    it "shows plane has taken off" do
      expect(subject.taken_off).to eq true
    end
  end

end
