require 'airport.rb'

describe Airport do

  let (:airport) {Airport.new}

  it "should respond to method land" do
    expect(airport).to respond_to :let_land
  end

  it { is_expected.to respond_to :let_land}

  describe '#let_land' do
    it 'should let specific plane to land' do
      plane = Plane.new
      expect(airport.let_land(plane)).to be plane
    end
  end




end
