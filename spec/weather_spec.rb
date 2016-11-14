class GoodRandomnessStub
  def create_number
    1
  end
end

class BadRandomnessStub
  def create_random
    0
  end
end

describe Weather do
  subject(:good_weather) {described_class.new(GoodRandomnessStub.new)}
  subject(:bad_weather) {described_class.new(BadRandomnessStub.new)}

  it "should return good conditions when you're lucky" do
    expect(good_weather.conditions).to eq :good
  end

  it "should return stormy conditions when you're not lucky" do
    expect(bad_weather.conditions).to eq :stormy
  end


end
