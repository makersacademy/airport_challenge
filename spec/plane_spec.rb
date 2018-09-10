require 'plane.rb'

describe Plane do

  it { is_expected.to respond_to :confirm_takeoff }
  it { is_expected.to respond_to :landed }
  it { is_expected.to respond_to :report_landed }
  it { is_expected.to respond_to :is_flying }

  describe "initialize" do
    it 'initializes is_landed to false' do
      expect(subject.landed).to eq false
    end
  end

  describe "report_landed" do
    it "reports that plane is landed" do
      subject.report_landed
      expect(subject.landed?).to eq true
    end
  end

  describe "landed?" do
    it "confirms that plane has landed or not" do
      expect(subject.report_landed)
      expect(subject.landed?).to eq true
    end
  end

  describe "confirm_takeoff" do
    it "confirms that plane has taken off" do
      expect(subject.confirm_takeoff)
      expect(subject.takeoff?).to eq true
    end
  end


  # it "reports that plane has landed" do
  #   airport = Airport.new
  #   plane = airport.land(Plane.new)
  #   expect(plane.is_landed).to eq true
  # end

end
