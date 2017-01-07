require "plane.rb"

describe Plane do
  # chech plane basic functions
  it 'ckecks that the plane exists' do
    expect(subject).to be_a(Plane)
  end
  it 'checks that the plane can fly' do
    expect(subject.fly?).to eq(true)
  end
end
