require "airport"

RSpec.describe Airport do
  let(:plane) {double :plane, :class => Plane, :takeoff => true}

  describe "#initialize" do
    it "sets default capacity to #{Airport::DEFAULT_CAPACITY}" do
      (Airport::DEFAULT_CAPACITY).times {subject.receive(plane,->{false})}
      expect(subject.allow?()).to eq false
    end

    it "allows the designer to override capacity" do
      new_capacity = 50
      airport = Airport.new(new_capacity)
      new_capacity.times { airport.receive(plane,->{false})}
      expect(airport.allow?()).to eq false
    end
  end

  describe "#receive" do
    it "allows airport to store valid plane"do
      subject.receive(plane,->{false})
      expect(subject.planes).not_to be_empty
    end


  end

  describe "#send" do
    it "allows a plane to take off" do
      subject.receive(plane,->{false})
      expect(subject.send(->{false})).to be_truthy 
    end

    it "removes the plane from the airport" do
      subject.receive(plane,->{false})
      subject.send(->{false})
      expect(subject.planes).to be_empty
    end

    it "disallows takeoff if no planes" do
      expect(subject.send(->{false})).to eq(false)
    end

    it "disallows takeoff if weather is bad" do
      subject.receive(plane,->{false})
      expect(subject.send(->{true})).to eq(false)
    end

    it "allows takeoff if weather is good" do
      subject.receive(plane, ->{false})
      expect(subject.send(->{false})).to eq(true)
    end

    it "instructs plane to take off" do
      subject.receive(plane, ->{false})
      expect(subject.send(->{false})).to eq(true)
    end
  end
  
  describe "#allow?" do
    it "allows planes to land if there's space" do
      expect(subject.allow?(->{false})).to eq true
    end

    it "prevents landing if airport is full" do
      (Airport::DEFAULT_CAPACITY).times{subject.receive(plane,->{false})}
      expect(subject.allow?(->{false})).to eq false
    end

    it "doesn't allow plane to land if bad weather" do
      expect(subject.allow?(->{true})).to eq(false)
    end

    it "allows plane to land if good weather" do
      expect(subject.allow?(->{false})).to eq(true)
    end
  end

  describe "#bad_weather?" do
    it "returns true if weather is bad" do
      expect(subject.bad_weather?(->{true})).to eq true
    end

    it "returns false if the weather is good" do
      expect(subject.bad_weather?(->{false})).to eq false
    end

    it "generates weather conditions randomly" do
      results = []
      50.times {results.push(subject.bad_weather?)}
      expect(results.include?(true)&&results.include?(false)).to eq true
    end
  end
end
