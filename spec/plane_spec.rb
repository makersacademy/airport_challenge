require 'plane.rb'

describe Plane do

  let(:airport) {double :airport}

  it {is_expected.to respond_to :land }
  it {is_expected.to respond_to :take_off}

  it 'take off from the airport they are' do
    plane = subject.new
    allow(airport).to receive(:landing).and_return(plane)
    allow(airport).to receive(:taking_off).and_return(plane)
  end

end
