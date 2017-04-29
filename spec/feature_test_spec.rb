require 'airport'

feature 'Feature test' do
  let(:weather) { double :weather }
  let(:airport) { double :airport }

  scenario 'lands and takes off multiple planes' do
    sets_up_multiple_planes
    checks_the_capacity_limit
    attempts_to_takeoff_missing_plane
    verifies_landed_status
    and_tests_edge_cases
    then_verifies_simple_landing_check
  end

  def sets_up_multiple_planes
    @gatwick, @heathrow = Airport.new(30), Airport.new
    allow(@gatwick).to receive(:stormy?).and_return(false)
    allow(@heathrow).to receive(:stormy?).and_return(false)
    @boeing, @jet, @concorde = Plane.new, Plane.new, Plane.new
  end

  def checks_the_capacity_limit
    30.times { @gatwick.land(Plane.new) }
    expect { @gatwick.land(@jet) }.to raise_error 'Airport full'
  end

  def attempts_to_takeoff_missing_plane
    @heathrow.land(@boeing)
    message = 'Plane is not in the airport'
    expect { @heathrow.takeoff(@jet) }.to raise_error message
  end

  def verifies_landed_status
    expect(@jet).not_to be_landed
    @heathrow.land(@concorde)
    expect(@concorde).to be_landed
  end

  def and_tests_edge_cases
    @heathrow.takeoff(@boeing)
    expect { @boeing.send(:takeoff) }.to raise_error 'Already flying'
    message = 'Plane already landed elsewhere!'
    expect { @gatwick.land(@concorde) }.to raise_error message
    message = 'Plane is already in the airport'
    expect { @heathrow.land(@concorde) }.to raise_error message
  end

  def then_verifies_simple_landing_check
    @heathrow.land(@jet)
    expect(@heathrow.holds_plane?(@jet)).to eq true
  end
end
