require 'airplane'

describe Airplane do

  context "Airplane Landing Test" do
    describe "Airplane can receive instruction to land" do
      it { is_expected.to respond_to(:land) }

    end
  end

      it "Airplane confrims safe landing" do
      expect(subject.land).to eq true

      end

  context "Airplane Test For Take Off" do
    describe "Airplane can receive instruction for take off" do
      it { is_expected.to respond_to(:take_off) }
    end
  end
end
