require 'airport'

describe Airport do

  before(:each) do

  end

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }
    it "confirms that plane is no longer in the airport" do
      expect(subject.take_off("Plane")).to eq "Plane is no longer in the airport"
    end
  end

end
