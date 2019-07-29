require 'controller'
require 'airport_hanger'
require 'airport_runway'

describe Controller do

  describe 'storm conditions' do
    it "cannot take off when storm reported" do
      runway = AirportRunway.new
      runway.report_storm
      hanger = AirportHanger.new
      expect{subject.greenlighttakeoff(hanger, runway)}.to raise_error 'cannot take off'
    end
  end

  describe 'storm conditions' do
    it "cannot land when storm reported" do
      runway = AirportRunway.new
      runway.report_storm
      hanger = AirportHanger.new
      expect{subject.greenlightlanding(hanger, runway)}.to raise_error 'cannot land'
    end
  end

  

end
