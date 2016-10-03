require 'airport1.rb'
require 'plane.rb'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double:plane }
  let(:weather) { double:weather }

  before do
  allow_any_instance_of(Weather).to receive(:stormy).and_return(false)
  end

  describe 'landing planes' do
      it 'has the plane after it has landed' do
        plane = double("plane", :in_air => "flying", :change_status => 'flying')
        airport.land(plane)
        expect(airport.planes).to include plane
      end
      it 'raises an error when it asks an already landed plane to land' do
        plane = double("plane", :in_air => "landed", :change_status => "landed")
        expect{airport.land(plane)}.to raise_error "this plane has already landed"
      end
      it "raises error when airport is full and plane wants to land" do
        plane = double("plane", :in_air => 'flying', :change_status => 'flying')
        airport.capacity.times {airport.land(plane)}
        expect{airport.land(plane)}.to raise_error "airport is full"
      end
  end

  describe 'planes taking off' do
    it 'instructs the plane to take off' do
      expect(airport).to respond_to(:take_off)
    end
    it 'it no longer has the plane after it has taken off' do
      plane = double("plane", :in_air => 'flying', :change_status => "flying")
      airport.land(plane)
      airport.take_off
      expect(airport.planes).not_to include plane
    end
    it 'airport is empty' do
    message = 'Airport is empty, no planes can take off'
    expect{airport.take_off}.to raise_error message
    end
  end

  describe 'weather conditions' do
    it 'does not allow planes to land if weather is stormy' do
    allow_any_instance_of(Weather).to receive(:stormy).and_return(true)
    plane = double("plane", :in_air => 'flying', :change_status => 'flying')
    message = "This plane cannot land due to stormy weather"
    expect{airport.land(plane)}.to raise_error message
  end
    it 'does not allow planes to take off if weather is stormy' do
    allow_any_instance_of(Weather).to receive(:stormy).and_return(true)
    message = "This plane cannot take_off due to stormy weather"
    expect{airport.take_off}.to raise_error message
  end
end
end
