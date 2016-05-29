require 'weather'

describe Weather do

  it 'responds to stormy?' do
    expect(subject).to respond_to :stormy?
  end

  describe '#stormy?' do
    it "returns true or false" do
      expect([true, false]).to include subject.stormy?
    end
  end
end
