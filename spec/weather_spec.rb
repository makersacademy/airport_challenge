require 'weather'

describe Weather do

  it { is_expected. to respond_to(:forecast) }

  describe '#forecast' do
    it "returns stormy or sunny" do
      expect(subject.forecast). to eq("Sunny").or eq("Stormy")
    end
  end
end
