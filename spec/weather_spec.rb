require 'weather'

describe Weather do
  subject { Weather.new }
  let(:conditions_array) { ["stormy", "sunny", "cloudy", "rainy", "snowy"] }

  it "should return an instance of Weather" do
    expect(subject).to be_an_instance_of(Weather)
  end

  describe "#conditions" do
    it "should return the conditions array" do
      expect(subject.conditions).to eq(conditions_array)
    end
  end

  describe "#stormy?" do
    it "should respond to #stormy?" do
      expect(subject).to respond_to(:stormy?)
    end


  end
end
