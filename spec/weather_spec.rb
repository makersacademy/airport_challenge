require_relative '../lib/weather'

describe Weather do

  subject { described_class.new }

  it " Tests outcome of calling stormy? method is true or false" do
    expect(subject.stormy?).to be(true).or be(false)
  end
  
end
