describe 'Feature Tests' do
  plane_symbols = [:boeing, :private_jet, :dream_liner, :airbus, :biplane]
  plane_symbols.each { |plane| let(plane) { new_plane } }

  airport_symbols = [:jfk, :lhr, :lgw, :lax, :dxb]
  airport_symbols.each { |airport| let(airport) { new_airport } }

  let(:weather) { new_weather }

  context 'classes' do
    it 'instantiates the class' do
      expect(lhr).to be_an_instance_of Airport
      expect(boeing).to be_an_instance_of Plane
      expect(weather).to be_an_instance_of Weather
    end
  end

  context 'landing and taking off aircraft' do
    before { let_there_be_sun }

    it 'sucessfully lands and takes off one aircraft' do
      expect(lhr.contain?(boeing)).to be false
      expect(boeing.status).to be :air

      boeing.land(lhr)
      expect(lhr.contain?(boeing)).to be true
      expect(boeing.status).to be :ground

      boeing.take_off(lhr)
      expect(lhr.contain?(boeing)).to be false
      expect(boeing.status).to be :air
    end

    it 'successfully lands multiple aircraft' do
      10.times { land_plane(lhr) }
      expect(lhr.send(:planes).count).to be 10

      5.times { land_plane(lhr) }
      expect(lhr.send(:planes).count).to be 15
    end

    it 'lands and takes off multiple successive aircraft' do
      boeing.land(lhr); airbus.land(lhr)
      expect(lhr.contain?(boeing)).to be true
      expect(lhr.contain?(airbus)).to be true

      airbus.take_off(lhr)
      expect(lhr.contain?(airbus)).to be false
      expect(lhr.contain?(boeing)).to be true

      dream_liner.land(lhr); biplane.land(lhr)
      boeing.take_off(lhr); biplane.take_off(lhr)

      expect(lhr.contain?(dream_liner)).to be true
      expect(lhr.contain?(boeing)).to be false
    end
  end

  context 'raising errors' do
    context 'when stormy' do
      before {
        let_there_be_sun; boeing.land(lhr);
        dream_liner.land(lax); make_it_rain
      }

      it 'raises weather errors as expected' do
        expect { boeing.take_off(lhr) }.to raise_error WeatherError
        expect { airbus.land(jfk) }.to raise_error WeatherError
        expect { dream_liner.take_off(lax) }.to raise_error WeatherError
        expect { biplane.land(lgw) }.to raise_error WeatherError
      end
    end

    context 'when sunny' do
      before { let_there_be_sun }

      it 'raises all other errors as expected' do
        expect { dream_liner.take_off(lax) }.to raise_error TakeOffError

        biplane.land(lgw)
        expect { biplane.take_off(dxb) }.to raise_error AirportError

        dream_liner.land(jfk)
        expect { dream_liner.land(lax) }.to raise_error LandingError

        49.times { new_plane.land(lhr) }
        expect { airbus.land(lhr) }.not_to raise_error
        expect { boeing.land(lhr) }.to raise_error CapacityError
      end
    end
  end
end
