require 'airport'

describe Airport do

  it { should respond_to(:full?) }

  it "should return true when asked if full when default capacity is reached" do
    Airport::DEFAULT_CAPACITY.times { Plane.new.land(subject) }

    expect(subject.full?).to eq true
  end

end