require 'weather'

describe Weather do

  it { is_expected.to be_an_instance_of(Weather) }

  describe "#storm?" do
    it "should return true or false when called on Weather class" do
      expect(subject.storm?).to be(true).or be(false)
    end
  end
end
