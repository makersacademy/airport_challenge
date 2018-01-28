require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  it 'creates a new instance' do
    expect(subject).to be_a Weather
  end

  describe 'stormy weather' do
    it "returns true if stormy and false if not stormy" do
      expect(subject.stormy?).to be(true).or(be(false))
    end
  end
end
