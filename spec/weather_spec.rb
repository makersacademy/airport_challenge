require 'weather'

describe Weather do
  subject { Weather.new }
  let(:conditions_array) { [1, 0, 0, 0, 0] }

  it "should return an instance of Weather" do
    expect(subject).to be_an_instance_of(Weather)
  end

  describe "#stormy?" do
    it "should respond to #stormy?" do
      expect(Weather).to respond_to(:stormy?)
    end

    it "should return an element of conditions_array" do
      expect(conditions_array).to include(Weather.stormy?)
    end
  end
end
