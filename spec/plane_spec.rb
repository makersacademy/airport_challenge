require 'plane'
describe Plane do
  subject(:plane) {plane = Plane.new}

  describe '#land' do

    it {should respond_to(:land).with(1).argument}

    it 'should not be able to land if it already landed' do
      airport = double(:airport,stormy: false)
      plane.land(airport)
      expect{plane.land(airport)}.to raise_error("You are not flying Fool!")
    end

    it 'should not be allowed to land if the weather is stormy' do
      airport = double(:airport,stormy: true)
      expect{plane.land(airport)}.to raise_error("It's raining Fool!")
    end


  end

  describe '#take_off' do

    it {should respond_to(:take_off).with(1).argument}

    it 'should not be able to take_off if it is already in the air' do
      airport = double(:airport,stormy: false)
      plane.take_off(airport)
      expect{plane.take_off(airport)}.to raise_error("You are flying Fool!")
    end

    it 'should not be allowed to take off if the weather is stormy' do
      airport = double(:airport,stormy: true)
      expect{plane.take_off(airport)}.to raise_error("It's raining Fool!")
    end
  end

  describe '#landed' do
    it 'should be able to confirm that it has landed' do
    airport = double(:airport,stormy: false)
    plane.land(airport)
    expect(plane.landed?).to eq true
    end


    it 'should be able to confirm that it is not longer on ground' do
    airport = double(:airport,stormy: false)
    plane.take_off(airport)
    expect(plane.landed?).to eq false
    end
  end


end

