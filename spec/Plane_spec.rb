require 'Plane'

describe Plane do 

  let(:plane) {Plane.new}


  describe 'At initialization' do

  	it 'flies' do
  		expect(plane.flying).to eq(true)
  	end 
  end

  describe 'take off' do

  	it 'takes_off' do
  		expect(plane.takes_off).to eq(true)
  	end 
  end

  describe 'landing' do

  	it 'lands' do 
  		expect(plane.land).to eq(false)
    end
  end
end