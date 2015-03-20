require 'capybara/rspec'

feature 'Grand Finale' do
  let(:planes) { [] }
  let(:airport) { Airport.new }
  before(:each) do
    6.times { planes.push(Plane.new) }
  end
  # Why am I doing this 6 times? Can't I just do it once?
  context 'in good weather:' do
    before do
      allow(airport).to receive(:weather).and_return('sunny')
    end
    scenario 'all planes can land and take off' do
      planes.each do |plane|
        airport.land_plane(plane)
        expect(plane).not_to be_flying
      end
      expect(airport.planes.length).to eq 6
      planes.each do |plane|
        airport.initialize_take_off(plane)
        expect(plane).to be_flying
      end
      expect(airport.planes.length).to eq 0
    end
  end

  context 'in bad weather:' do
    before do
      allow(airport).to receive(:weather).and_return('stormy')
    end
    scenario 'error raised if plane taking off/landing' do
      plane = Plane.new
      error_msg = 'Can not land, bad weather'
      expect { airport.land_plane(plane) }.to raise_error error_msg
      error_msg = 'Can not take off, bad weather'
      expect { airport.initialize_take_off(plane) }.to raise_error error_msg
    end
  end
end
