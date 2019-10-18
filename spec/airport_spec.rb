require 'airport'

describe Airport do
  it 'creates and instance of Airport' do
    expect(subject).to be_an_instance_of Airport
  end

  it 'allows a plane to land at airport' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.land(plane)).to include(plane)
  end

  it 'allows a plane to takeoff from and airport' do
    plane = Plane.new
    subject.takeoff(plane)
    expect(subject.zero?).to eq true #1
  end
end

# #sources

#1
# .zero predicate matcher
# https://relishapp.com/rspec/rspec-expectations/v/3-9/docs/built-in-matchers/predicate-matchers