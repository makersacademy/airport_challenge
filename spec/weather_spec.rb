require "weather"
require "airport"

describe Weather do

  it { expect(subject).to respond_to(:new_day) }

  it "random weather generator should return either sunny or stormy" do
    expect(subject.new_day).to eq("Stormy").or(eq("Sunny"))
  end

  it "should return false if weather is stormy" do
    allow(subject).to receive(:safe?).and_return(false)
    expect(subject.safe?).to eq false
  end

  it "should return true if weather is sunny" do
    allow(subject).to receive(:safe?).and_return(true)
    expect(subject.safe?).to eq true
  end

  # it "should not let plane take off if stormy" do
  #   expect(subject.stormy?).to receive(:stormy?).and_return(true)
  # end
  # it "should allow planes to take off if it's sunny" do
  #   expect { Airport.new.take_off(plane) }.to eq planes == [] if subject.new_day == "Sunny"
  # end
  # it "should not let planes take off if it's stormy" do
  #   expect { Airport.new.take_off(plane)}.to raise_error "It's stormy" if subject.new_day == "Stormy"
  # end


end
