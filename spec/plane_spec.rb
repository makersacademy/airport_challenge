require "plane.rb"

describe Plane do
  # check plane basic functions
  it 'plane exists' do
    expect(subject).to be_a(Plane)
  end
  it 'plane can fly' do
    expect(subject.fly?).to eq(true)
  end

  # checks that fly? function can get a parametr
  it 'fly can recieve a plane status' do
    expect(subject.fly?(true)).to eq(true)
    expect(subject.fly?(false)).to eq(false)
  end
end
