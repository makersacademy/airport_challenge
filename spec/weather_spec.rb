require "weather"
describe Weather do
  it { is_expected.to respond_to :status }
  it { is_expected.to respond_to :get_status }

  # describe "#generate" do
  #   it "should generate random weather and return chance" do
  #
  #   end
  # end

  describe "#set_status" do

    range_error = "Error! Storm chance is out of range (0..100)"
    it "should raise an error if storm_chance is less than range (0..100)" do
      allow(subject).to receive(:chance).and_return(-1)
      expect { subject.get_status }.to raise_error range_error
    end
    it "should raise an error if storm_chance is more than range (0..100)" do
      allow(subject).to receive(:chance).and_return(101)
      expect { subject.get_status }.to raise_error range_error
    end

    it "should set status to :stormy when storm_chance >= 90" do
      allow(subject).to receive(:chance).and_return(90)
      expect(subject.get_status).to eq :stormy
    end
    it "should set status to :calm when storm_chance < 90" do
      allow(subject).to receive(:chance).and_return(3)
      expect(subject.get_status).to eq :calm
    end
  end
end
