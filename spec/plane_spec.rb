require './lib/plane'
describe Plane do
  it { is_expected.to respond_to(:landed?) }
  it { is_expected.to respond_to(:taken_off?) }

  describe "print plane status" do
    it "prints: plane has taken off" do
      subject = Plane.new
      expect { subject.taken_off? }.to output("A plane has taken off\n").to_stdout
    end
  end
end
