require 'weather'

describe Weather do
  subject { Weather.new }
  let(:conditions_array) { [true, false, false, false, false] }

  it { is_expected.to be_an_instance_of(Weather) }

  describe "#stormy?" do
    it "should return an element of conditions_array" do
      expect(conditions_array).to include(subject.stormy?)
    end
  end
end
