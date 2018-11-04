require "airport"

describe Airport do
  
  let(:operable) { Weather.new }

  it { should respond_to(:land) }

  it "landed a/c can be store" do
    expect(subject.land(operable)).to eq [1]
  end

  it "landed a/c can be store" do
    3.times { subject.land(operable) }
    expect(subject.aircrafts.count).to eq 3
  end

  it "took off a/c will be gone" do
    subject.land(operable)
    subject.take_off(operable)
    expect(subject.aircrafts).to eq []
  end

  specify { expect(subject.capacity).to eq(10) }

  it "airport is full when reach capacity" do
    Airport::DEFAULT.times { subject.land(operable) }
    expect(subject.full?).to eq true
  end

  it "accept capacity config and return full when reach" do
    airport = Airport.new(3)
    3.times { airport.land(operable) }
    expect(airport.full?).to eq true
  end

  it "raise error if land a/c when airporti is full" do
    airport = Airport.new(3)
    expect { 4.times { airport.land(operable) } } .to raise_error "airport is full"
  end

  it "raise error when land with no permission" do
    something = Weather.new
    something.stormy
    expect { subject.land(something) } .to raise_error 
  end

  it "raise error when take off with no permission" do
    something = Weather.new
    something.stormy
    expect { subject.land(something) } .to raise_error 
  end
  
end