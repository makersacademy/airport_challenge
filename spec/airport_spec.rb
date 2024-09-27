require "airport"

describe Airport do

  it { expect(subject).to respond_to :weather }
  it { expect(subject).to respond_to :land }
  it { expect(subject).to respond_to :take_off }

  it "airplane has landed" do
    airplane = Airplane.new
    subject.land(airplane)
    expect(subject.instance_variable_get('@planes')).to include(airplane)
  end

  # it "check if airplane is in airport" do
  #   plane = Airplane.new
  #   subject.instance_variable_get('@planes')
  #   expect(subject@plane).to include(plane)
  # end

  # it "check airport is full" do
  #   expect(subject).to be_full
  # end
end
