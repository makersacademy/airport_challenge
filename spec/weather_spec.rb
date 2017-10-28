require 'weather'

describe Weather do
  subject { Weather.new }
  let(:conditions_array) { [true, false, false, false, false] }

  it "should return an instance of Weather" do
    expect(subject).to be_an_instance_of(Weather)
  end

  describe "#stormy?" do
    it "should respond to #stormy?" do
      expect(subject).to respond_to(:stormy?)
    end

    it "should return an element of conditions_array" do
      expect(conditions_array).to include(subject.stormy?)
    end
  end
end
