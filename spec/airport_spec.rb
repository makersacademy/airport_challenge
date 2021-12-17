require "airport"

describe Airport do

  it { expect(subject).to respond_to :weather }
  it { expect(subject).to respond_to :land_airplane }
  it { expect(subject).to respond_to :airplane_take_off }

  it "aiplane is in the airport" do
    plane = Airplane.new
    expect(subject.land_airplane(plane)).to include(plane)
  end

  # it "check airport is full" do
  #   expect(subject).to be_full
  # end
end
