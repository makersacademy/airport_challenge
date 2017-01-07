require "weather.rb"

describe Weather do
  subject(:weather) { Weather }

  describe ".sunny?" do

    it { is_expected.to respond_to(:sunny?) }

    context "random generator sets status to sunny" do
      it ".sunny returns true" do
        allow(weather).to receive(:randomize) { 21 }
        expect(weather.sunny?).to eq true
      end
    end

    context "random generator sets status to not sunny" do
      it ".sunny returns false" do
        allow(weather).to receive(:randomize) { 20 }
        expect(weather.sunny?).to eq false
      end
    end
  end


end
