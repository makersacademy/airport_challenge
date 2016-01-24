require 'airport'

describe Airport do
  it { is_expected.to respond_to(:full?)}
  it { is_expected.to respond_to(:planes)}
  it { is_expected.to respond_to(:capacity)}

  it "reports full when it has reached its capacity"do
    subject.capacity.times{ subject.planes << "plane" }
    expect(subject.full?).to eq true
  end
  it "reports not full when it hasn't reached capacity"do
    expect(subject.full?).to eq false
  end

  it 'has a default capacity'do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  (1..10).each do |n|
    it "capacity can be set as #{n}"do
      airport = Airport.new(n)
      expect(airport.capacity).to eq n
    end
  end

end
