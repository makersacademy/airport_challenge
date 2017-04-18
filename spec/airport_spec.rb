require 'airport'
#require 'plane'

describe Airport do
  subject(:airport) { described_class.new(15)}

  it 'Instructs plane to land' do
    expect(airport).to respond_to(:land).with(1).argument
  end

  it 'Confirms plane has landed' do
    airport.land('plane')
    expect(airport.landed? ('plane')).to eq true
  end

  it 'Instructs plane to take off' do
    expect(airport).to respond_to(:take_off)
  end

  it 'Confirms plane has taken off' do
    airport.land('plane')
    airport.take_off('plane')
    expect(airport.taken_off? 'plane').to eq true
  end

  it "Taking off denied: weather not ideal" do
    allow(airport).to receive(:non_ideal_weather?).and_return(false)
    airport.land('plane')
    allow(airport).to receive(:non_ideal_weather?).and_return(true)
		expect {airport.take_off ('plane')}.to raise_error "Take off denied: ideal weather conditions not met"
  end

  it "Landing denied: airport full" do
    15.times do
      airport.land('plane')
    end
    expect { airport.land('plane') }.to raise_error 'Landing denied: airport full'
  end
end
