require 'weather'

describe Weather do
  subject { Weather.new }
  let(:conditions_array) { ["stormy", "sunny", "sunny", "sunny", "sunny"] }

  it { is_expected.to be_an_instance_of(Weather) }

  describe "#stormy?" do
    it { is_expected.to respond_to(:weather) }

    it "should return an element of conditions_array" do
      expect(conditions_array).to include(subject.weather)
    end
  end
end
