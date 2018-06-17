
require "./lib/airport.rb"


describe Weather do

  # it { should respond_to(:stormy?) }


end

describe Airport do

  describe "#plane_landing" do
    it "should be true when airplane is landid" do
        airplane = Airplane.new
        expect(subject.plane_landing(airplane)).to include airplane
    end
  end

  describe "#take_off" do
    it "airplane left the airport" do
        airplane = Airplane.new
        subject.plane_landing(airplane)
        expect(subject.take_off).to eq airplane
    end
  end

  describe "the airport_full method" do
    it "raises an error when plane_landing if full" do
        airplane = Airplane.new
        subject.plane_landing(airplane)
        expect { subject.plane_landing Airplane.new }.to raise_error "airport is full"
    end
  end

  describe "#initialize" do
    it "should set the default_airport_capacity" do
        airport = Airport.new(5)
        5.times { airport.plane_landing(Airplane.new)  }
        expect(subject.airport_capacity).to eq(5)
    end
  end

  it 'does not allow plane to take off' do
    allow(weather).to receive(:stormy?).and_return(true)
    expect{subject.take_off}.to raise_error 'Cannot take off due to stormy weather'
  end
end
