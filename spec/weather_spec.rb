require 'weather'

describe Weather do
  it { is_expected.to respond_to :stormy? }

  it "is stormy less than 10% of the time" do
    expect(probability_check).to be < 0.1
  end

  def probability_check
    state = Weather.new
    total = 0
    10_000.times do
      total += 1 if state.stormy?
    end
    total / 10_000
  end

end
