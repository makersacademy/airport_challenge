require "airport"
require "plane"

describe Airport do

  it { is_expected.to respond_to(:land) }

  describe '#initialize' do
    it 'sets a default airport capacity' do
      # default capacity = 5
      dxb = Airport.new
      allow(dxb).to receive(:set_weather) { "sunny" }
      expect { 100.times { dxb.land Plane.new } }.to raise_error 'Airport is full'
    end
    it 'can override the default airport capacity' do
      dxb = Airport.new(30)
      allow(dxb).to receive(:set_weather) { "sunny" }
      30.times { dxb.land Plane.new }
      expect { dxb.land(Plane.new) }.to raise_error 'Airport is full'
    end
  end
  
  describe "#land" do
    it 'allows airplanes to land' do
      dxb = Airport.new
      allow(dxb).to receive(:set_weather) { "sunny" }
      pj = Plane.new
      dxb.land(pj)
      expect(dxb.hangar).to include(pj)
    end
    it 'prevents landing if weather is stormy' do
      dxb = Airport.new
      allow(dxb).to receive(:set_weather) { "stormy" }
      expect { dxb.land(Plane.new) }.to raise_error 'Cant land, bad weather!'
    end
    it 'prevents landed planes from landing again' do
      dxb = Airport.new
      allow(dxb).to receive(:set_weather) { "sunny" }
      pj = Plane.new
      dxb.land(pj)
      expect { dxb.land(pj) }.to raise_error 'This plane has already landed!'
    end  
    it 'only lands airplanes from Plane class' do
      # airport = Airport.new
      # allow(airport).to receive(:set_weather) { "sunny" }
      expect(:land).to be_a Plane
    end
  end

  describe "#take_off" do
    it 'instructs airplane to take off and confirms its left the airport' do  
      dxb = Airport.new
      allow(dxb).to receive(:set_weather) { "sunny" }
      pj = Plane.new
      dxb.land(pj)
      dxb.take_off(pj)
      expect(dxb.view_hangar).not_to include(pj)
    end
    it 'prevents take off if weather is stormy' do
      dxb = Airport.new
      allow(dxb).to receive(:set_weather) { "sunny" }
      pj = Plane.new
      dxb.land(pj)
      allow(dxb).to receive(:set_weather) { "stormy" }
      expect { dxb.take_off(pj) }.to raise_error 'Cant take off, bad weather!'
    end
    it 'limits take off to planes in relevant airport hangars' do
      dxb = Airport.new
      allow(dxb).to receive(:set_weather) { "sunny" }
      expect { dxb.take_off(Plane.new) }.to raise_error 'This plane is unavailable!'
    end

  end

end
# Sample double
# let(:stormy_airport) { double(:airport, :stormy? => true }
