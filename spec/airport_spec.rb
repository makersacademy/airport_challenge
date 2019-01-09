require 'airport.rb'

describe Airport do

  it "responds to the full? method" do
    expect(subject).to respond_to(:full?)
  end

  context "when initializing an airport" do

    it "is initialized with a default plane capacity" do
      expect(subject.full?).to eq(20)
    end

    it "'s plane capacity can be overwridden" do
      airport = Airport.new(15)
      expect(airport.full?).to eq(15)
    end

  end

end
