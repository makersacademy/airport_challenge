require "airport"

describe Airport do

  it { expect(subject).to respond_to :weather }
  it { expect(subject).to respond_to :land }
  it { expect(subject).to respond_to :take_off }

  it "airplane has landed" do
    airplane = Airplane.new
    expect(subject.land(airplane)).to include(airplane)
  end

  it "check if airplane is in airport" do
    plane = Airplane.new
    expect(@plane).to include(plane)
  end

  # it "check airport is full" do
  #   expect(subject).to be_full
  # end
end
