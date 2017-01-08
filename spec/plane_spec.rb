require 'airport'

describe Plane do

  describe "#land" do
    it {expect(subject).to respond_to(:land).with(1).argument}

    before do
      @airport = Airport.new
    end

    context "if a plane lands" do
      it { expect{subject.land(@airport)}.to change(@airport::planes, :count).from(0).to(1)}
    end

  end

  describe "#take_off" do
    it {expect(subject).to respond_to(:take_off).with(1).argument}

    before do
      @airport = Airport.new
      @plane = Plane.new
      @plane.land(@airport)
    end


  #  context "if a plane takes off" do
  #  it {expect{subject.take_off(@airport)}.to change{@airport.planes}}
  #  end
  end
  describe "#safe?" do

    it {expect(subject).to_not respond_to(:safe?)}
    
    before do
      @plane = Plane.new
      @airport = Airport.new
      @plane.land(@airport)
    end

    context "if the weather is safe" do
      it "will take_off" do
        #@plane = Plane.new
        #@airport = Airport.new
        #@plane.land(@airport)
        allow(@plane).to receive(:safe?).and_return( true )
        expect{@plane.take_off(@airport)}.to change{@airport.planes}
      end
    end

    context "if the weather is not safe" do
      it "will not take off" do
        #@plane = Plane.new
        #@airport = Airport.new
        #@plane.land(@airport)
        allow(@plane).to receive(:safe?) {false}
        expect{@plane.take_off(@airport)}.to raise_error
      end
    end
  end
end
