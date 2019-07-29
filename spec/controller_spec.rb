require 'controller'
require 'airport_hanger'
require 'airport_runway'

describe Controller do

  describe 'storm conditions' do
    it "cannot take off when storm reported" do
      runway = AirportRunway.new
      runway.report_storm
      hanger = AirportHanger.new
      plane = Plane.new
      expect{subject.greenlighttakeoff(hanger, runway, plane)}.to raise_error 'cannot take off'
    end

    it "cannot land when storm reported" do
      runway = AirportRunway.new
      runway.report_storm
      hanger = AirportHanger.new
      plane = Plane.new
      expect{subject.greenlightlanding(hanger, runway, plane)}.to raise_error 'cannot land'
    end
  end

  describe 'good weather' do
    it 'can land if safe conditions and theres space' do
      runway = AirportRunway.new
      hanger = AirportHanger.new
      plane = Plane.new
      subject.greenlightlanding(hanger, runway, plane)
      expect(hanger.planes.count). to eq(1)
  end
end


end
