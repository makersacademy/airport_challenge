
describe Weather do
  subject(:good_weather) {described_class.new(1)}
  subject(:bad_weather) {described_class.new(0)}

  it "should return good conditions when you're lucky" do
    expect(good_weather.conditions).to eq :good
  end

  it "should return stormy conditions when you're not lucky" do
    expect(bad_weather.conditions).to eq :stormy
  end


end
