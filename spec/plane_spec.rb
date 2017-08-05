require_relative '../lib/plane'

describe Plane do

  subject { described_class.new }

  it "Plane takes off" do
    expect(subject).to respond_to(:take_off)
  end
  
end
