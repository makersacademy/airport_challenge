describe Weather do

  it "is usually sunny" do
    expect(subject.stormy).to eq false
  end

  it "the weather can be stormy" do
    weather = Weather.new
    test_array = []
    500.times { test_array << weather.stormy? }
    expect(test_array).to include true && false
  end

end
