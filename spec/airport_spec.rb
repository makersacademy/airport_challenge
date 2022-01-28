require_relative '../lib/airport'

describe Airport do

  it { is_expected.to respond_to(:take_off) }
  it { is_expected.to respond_to(:land) }

  describe "#take_off" do
    it "lands" do
      expect(subject).to respond_to(:take_off).with(1).argument
    end
  end 

end
