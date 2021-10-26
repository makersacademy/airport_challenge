require 'airport'

describe Airport do
    
  it { is_expected.to respond_to(:capacity) }

  it { is_expected.to respond_to(:capacity).with(1).argument }

  it 'prevents landing when the airport is full' do 
    boeing = Plane.new
    jfk = Airport.new
    jfk.capacity(2)
    expect { boeing.land('jfk') }.to raise_error('Landing prevented as airport is full')
  end

end