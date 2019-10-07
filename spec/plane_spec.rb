require 'plane.rb'

describe Plane do
  it 'can create plane' do
    plane = Plane.new
      expect(plane.class).to eq(Plane)
   end
 end
