describe "Features" do
  let(:heathrow) { Airport.new(50) }
  let(:plane) { Plane.new }

  # As an air traffic controller
  # So I can get passengers to a destination
  # I want to instruct a plane to land at an airport
  it 'instructs a plane to land so passengers get to a destination' do
    allow(heathrow).to receive(:stormy?).and_return(false)
    expect { heathrow.land(plane) }.not_to raise_error
  end

  context 'when the weather is stormy' do
    before do 
      allow(heathrow).to receive(:stormy?).and_return(false)
    end
# As an air traffic controller 
# So I can get passengers on the way to their destination 
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
    it 'instructs a plane to take off so passengers get to a destination' do
      expect { heathrow.take_off(plane) }.not_to raise_error
    end

# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when the airport is full 
    context 'when the airport is full' do

    it 'does not allow plane to land to ensure safety' do
      50.times { heathrow.land(plane) }
      expect { heathrow.land(plane) }.to raise_error('The airport is full.')
    end

    end
  end 
# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

  context 'when the weather is stormy' do
    before do 
      allow(heathrow).to receive(:stormy?).and_return(true)
    end

    it 'does not allow plane to land to ensure safety' do
      expect { heathrow.land(plane) }.to raise_error('Cannot land - it is stormy.')
    end

    it 'does not allow plane to take off to ensure safety' do
      expect { heathrow.take_off(plane) }.to raise_error('Cannot take off - it is stormy.')
    end
  end
end
