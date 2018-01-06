require 'weather'

describe Weather do

  it { is_expected.to be_an_instance_of(Weather) }

  describe "#storm?" do
    it "should return true if weather is stormy" do
      allow(subject).to receive_message_chain(:weather, :storm?) { true }
      expect(subject.storm?).to eq true
    end
  end
end
