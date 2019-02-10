require 'weather'

describe Weather do

  it "should be stormy 20% of the time" do
    stormy = 0
    iterations = 10000
    iterations.times do
      if subject.stormy?
        stormy +=1
      end
    end
    expected_stormy = iterations * 20 / 100
    delta = iterations * 1 / 100
    expect(stormy).to be_within(delta).of(expected_stormy)
  end
end
