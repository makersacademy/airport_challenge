require 'weather'

describe Weather do
  it { should respond_to(:stormy?) }

  describe '#stormy' do
    it "returns either true or false depending on weather" do
      expect(subject.stormy?).to be(true).or(be(false))
    end
  end

end
