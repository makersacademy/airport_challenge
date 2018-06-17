require 'airport'

describe Airport do

  it { should respond_to(:land).with(1).argument }

  it { should respond_to(:take_off).with(1).argument }

  describe '#initialize' do
    it 'should create an empty array' do
      expect(subject.planes).to eq []
    end
  end

  describe '#land' do

    it "should store landed plane" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end

    it "should stop the same plane landing twice" do
      plane = Plane.new
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error "Plane already at airport"
    end

  end

  describe '#take_off' do

    it "should remove plane from planes array" do
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes). to eq []
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

  end

end
