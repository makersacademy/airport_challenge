require 'airplane'

describe Airplane do

  context "Airplane Landing Test" do
      it "Airplane can receive instruction to land" do
      expect(subject).to respond_to(:land)

      end
  end

      it "Airplane confrims safe landing" do
      expect(subject.land).to eq true

      end
end
