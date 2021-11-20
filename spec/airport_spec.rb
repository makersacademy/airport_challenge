require 'airport'

describe Airport do

  # it { is_expected.to respond_to :initialize}

  it "has an initialize method with a default capacity (42)" do 
    airport = Airport.new
    expect(airport).to be_an_instance_of(Airport)
    allow(airport).to receive_messages([])
  end

  it "can instruct planes to land" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "can instruct planes to take off" do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it "raise an error when at full capacity" do
    # full_airport = Airport.new
    # populate that array @hangar
    Airport::CAPACITY.times { subject.land(Plane.new) }
    # plane43 = Plane.new
    expect { subject.land(Plane.new) }.to raise_error 'Airport is full'
  end
end
