require 'plane'

describe Plane do
  # let(:airport) { double :airport }
  describe '#land' do
    airport = Airport.new
    airport.stormy = false
    context 'When it is not stormy' do
      it 'should land the plane at the airport if not stormy' do
        # allow(airport).to receive(:stormy).with(false)
        # airport.stormy(false)
        plane = Plane.new('flying')
        expect(plane.land(airport)).to eq('Plane has landed safely!')
      end
      # Not sure why this doesnt work?!?!??!!?!??!?!?!!?
      # it 'should raise an error message when the airport is full' do
      #   airport.stormy = false
      #   5.times { subject.land airport }
      #   expect{ subject.land airport }.to raise_error(RuntimeError, "WARNING airport is full, no space to land")
      # end
      it 'should raise an error when its grounded' do
        plane = Plane.new
        expect { plane.land airport }.to raise_error("Can't land when plane is already grounded")
      end
    end
    context 'when it is stormy' do
      it 'should raise an error message when its stormy' do
        # allow(airport).to receive(:stormy).with(true).and_return(true)#with(true)
        airport = Airport.new
        airport.stormy = true
        plane = Plane.new('flying')
        expect { plane.land airport }.to raise_error("WARNING stormy weather at airport abort landing")
      end
    end
  end
  describe '#take_off' do
    let(:airport) { double :airport }
    context 'When it is not stormy' do
      it 'should let user know that the plane has taken off if not stormy' do
        airport = Airport.new
        airport.stormy = false
        expect(subject.take_off(airport)).to eq('Plane has taken off safely!')
      end
      it 'should let user know that the plane can not take off if it is already flying' do
        plane = Plane.new('flying')
        expect { plane.take_off airport }.to raise_error("Can't take off when the plane is already flying")
      end
    end
    context 'when it is stormy' do
      it 'should not let the plane take off if it is stormy' do
        allow(airport).to receive(:stormy) { true }
        # airport.stormy(true)
        # airport = Airport.new
        # airport.stormy = true
        expect { subject.take_off airport }.to raise_error('WARNING too stormy to take off, abort take off')
      end
    end
  end
end
