require 'weather'

describe Weather do
  subject(:weather) {Weather.new}

  describe"#random_num" do
    it { is_expected.to respond_to(:random_num) }
    it "is expected to return a number between one and ten" do
      expect(subject.random_num).to be_between(1, 10).inclusive
    end
  end

  describe "#make_weather" do
    it { is_expected.to respond_to(:make_weather) }
    it { is_expected.to respond_to(:make_weather).with(1).argument}

    context "when number is between 1 and 6 inclusive" do
      it "is expected to set the current_weather to 'Sunny'" do
        subject.make_weather(5)
        expect(subject.current_weather).to eq "Sunny"
      end
    end

    context "when number is between 7 and 10 inclusive" do
      it "is expected to set the current weather to 'Stormy'" do
        subject.make_weather(8)
        expect(subject.current_weather).to eq "Stormy"
      end
    end
  end
end
