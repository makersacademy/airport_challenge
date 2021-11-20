require 'airport'

describe Airport do

  # it { is_expected.to respond_to :initialize}

  it "has an initialize method with a default capacity" do 
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

end
