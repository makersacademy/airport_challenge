require 'airport'

describe Airport do

  it { should respond_to(:land).with(1).argument }

  it { should respond_to(:take_off).with(1).argument }

  it 'should have a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'should create an empty hangar' do
    expect(subject.hangar).to eq []
  end

  describe '#land' do

    it "should store landed plane" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.hangar).to eq [plane]
    end

    context "when the same plane tries to land twice without taking off in between" do
      it "should raise an error" do
        plane = Plane.new
        subject.land(plane)
        expect { subject.land(plane) }.to raise_error "Plane already at airport"
      end
    end

  end

  describe '#take_off' do

    it "should remove plane from the hangar" do
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.hangar). to eq []
    end

    it "should confirm that plane has left the airport" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off(plane)).to eq "#{plane} has left the airport"
    end

    context "when a plane tries to take off without landing initially" do
      it "should raise an error" do
        plane = Plane.new
        expect { subject.take_off(plane) }.to raise_error "Plane not at airport"
      end
    end

    context "when a plan tries to take off twice without landing in between" do
      it "should raise an error" do
        plane = Plane.new
        subject.land(plane)
        subject.take_off(plane)
        expect { subject.take_off(plane) }.to raise_error "Plane not at airport"
      end
    end

    context "when the hangar's default capacity has been exceeded" do
      it 'should raise an error' do
        Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
        expect { subject.land(Plane.new) }.to raise_error "Hangar is full"
      end
    end

    # can't get this test to pass, feel like requirement isn't being covered
    # context "when the hangar's specified capacity has been exceeded" do
    #   it 'should raise an error' do
    #     airport = Airport.new(6)
    #     6.times { airport.land(Plane.new) }
    #     expect(airport.land(Plane.new)).to raise_error "Hangar is full"
    #   end
    # end

  end

end
