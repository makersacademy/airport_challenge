require 'plane.rb'

describe Plane do

  it 'has to confirm take off' do
    expect(subject).to respond_to :take_off_confirmed?
  end
  
end
