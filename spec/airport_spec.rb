require 'airport'

describe Airport do
  #force a fair weather airport
  before {subject.weather.instance_variable_set(:@condition, "Sunny") } 

  context "on creation" do
    it "should have somewhere to hold aircraft" do
      expect(subject).to respond_to :hangar
    end

    it "should be able to store multiple aircraft" do
      expect(subject.hangar).to be_instance_of Array
    end

    it "should have weather" do
      expect(subject.weather).to be_kind_of Weather
    end

    it "should have a maximum capacity" do
      expect(subject).to respond_to :capacity
    end

    it "should instantiate to the default capacity" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it "should be able to have a custom capacity as needed" do
      custom_capacity = 50
      airport = Airport.new(custom_capacity)
      expect(airport.capacity).to eq custom_capacity
    end
  end

  context "when landing aircraft" do
    it "should allow aircraft to land" do
      airplane = double(:plane, land!: nil, landed?: false)
      expect(airplane).to receive(:land!).with subject.weather
      subject.land airplane
      expect(subject.hangar[0]).to eq airplane
    end
  end

  context "when taxiing aircraft" do
    it "should allow aircraft to take off" do
      airplane = double(:plane, take_off!: nil)
      subject.instance_variable_set(:@hangar, [airplane])
      expect(airplane).to receive(:take_off!).with subject.weather
      subject.taxi(airplane)
    end

    it "should have an empty hangar after one plane takes off" do
      airplane = double(:plane, take_off!: nil)
      subject.instance_variable_set(:@hangar, [airplane])
      subject.taxi airplane
      expect(subject.hangar).to eq []
    end

    it "should only remove the specific plane from the hangar" do
      plane1 = double(:plane, take_off!: nil)
      plane2 = double(:plane, take_off!: nil)
      subject.instance_variable_set(:@hangar, [plane1, plane2])

      subject.taxi(plane1)
      expect(subject.hangar).not_to include plane1
      expect(subject.hangar).to include plane2
    end
  end

  context "in case of bad weather" do
    it "should not allow aircraft to land" do
      subject.weather.instance_variable_set(:@condition, "Stormy")
      airplane = double(:plane, land!: nil)

      subject.land(airplane)
      expect(subject.hangar).not_to include airplane
    end

    it "should not allow aircraft to take off" do
      subject.weather.instance_variable_set(:@condition, "Stormy")
      airplane = double(:plane, take_off!: nil)
      subject.instance_variable_set(:@hangar, [airplane])

      subject.taxi(airplane)
      expect(subject.hangar).to include airplane
    end
  end
end
