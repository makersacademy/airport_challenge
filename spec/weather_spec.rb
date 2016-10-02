require "weather"

describe Weather do

  before :each do
    @test_arr = []
    1000.times { @test_arr << subject.stormy? }
  end

  it "can produce true as an output" do
    expect(@test_arr).to include true
  end

  it "can produce false as an output" do
    expect(@test_arr).to include false
  end
end
