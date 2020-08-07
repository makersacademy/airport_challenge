require 'airport'

describe Airport do

  it 'has a plane in the hanger' do
    plane = Plane.new
    expect(subject.hanger(plane)).to eq plane
  end

   it 'releases a plane' do
     plane = Plane.new
     subject.hanger(plane)
     expect(subject.take_off).to eq plane
   end

   it 'raises an error if the hanger is full' do
    Airport::DEFAULT_CAPACITY.times {subject.hanger Plane.new}
   expect {subject.hanger Plane.new}.to raise_error "Hanger is full"
   end
end