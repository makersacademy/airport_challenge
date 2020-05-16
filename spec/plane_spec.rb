require_relative '../lib/plane.rb'

describe Plane do ## update test when airport class is created

  before(:each) do
    @airport_a = Airport.new
    @airport_b = Airport.new
    @plane_a = Plane.new
    @plane_b = Plane.new
  end

  describe '#land_at(airport)' do
    it "should be at the airport it landed at,and tell the operator that it landed" do
      expect { @plane_a.land_at(@airport_a) }.to output("landed at #{@airport_a}\n").to_stdout
    end
    it "should only be able to land if it is flying, and tell the operator about the problem" do
      @plane_a.land_at(@airport_a)
      expect { @plane_a.land_at(@airport_b) }.to output("currently located at #{@airport_a} so can not land\n").to_stdout
    end
    it "should not land at full airports, and tell the operator about the situation" do
      @airport_a.capacity = 1
      @plane_a.land_at(@airport_a)
      expect { @plane_b.land_at(@airport_a) }.to output("#{@airport_a} is full\n").to_stdout
    end
  end

  describe '#takeoff_from(airport)' do
    it "should leave airport and begin flying, and tell the operator it departed" do
      @plane_a.land_at(@airport_a)
      expect { @plane_a.takeoff_from(@airport_a) }.to output("departed #{@airport_a}\n").to_stdout
    end
    it "shouldn't takeoff from somewhere it is not, and tell the operator about the problem" do
      @plane_a.land_at(@airport_a)
      expect { @plane_a.takeoff_from(@airport_b) }.to output("currently located at #{@airport_a} so can not takeoff\n").to_stdout
    end
    it "should be removed from the airport's list of plane_as" do
      @airport_a.capacity = 1
      @plane_a.land_at(@airport_a)
      @plane_a.takeoff_from(@airport_a)
      expect { @plane_b.land_at(@airport_a) }.to output("landed at #{@airport_a}\n").to_stdout
    end
  end
end
