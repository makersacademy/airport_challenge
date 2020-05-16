require 'plane'

describe Plane do
  subject { Plane.new }

  let (:airport) { Airport.new }

  it 'responds to land method with one argument' do
    expect(subject).to respond_to(:land)
  end

  it 'responds to take_off method with one argument' do
    expect(subject).to respond_to(:take_off)
  end

end
