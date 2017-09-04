require 'control_tower'
require 'plane'
require 'weather_report'

describe CONTROL_TOWER do

    it 'TAKE OFF AND CONFIRM PLANE IS NO LONGER ON THE RUNWAY.' do
    plane=PLANE.new
    subject.storm?
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.planes).to eq []
  end

    it 'CHECK THE WEATHER REPORT FROM THE CONTROL TOWER.' do
    allow(subject).to receive(:weather).and_return('stormy')
    expect(subject.weather).to eq 'stormy'
  end

    it 'LAND PLANE AND CHECK IT IS ON THE RUNWAY.' do
    plane=PLANE.new
    tower=CONTROL_TOWER.new
    tower.current_weather='clear'

    expect(tower.land(plane)).to eq [plane]
  end

    it 'PREVENT LANDING WHEN WEATHER IS STORMY' do
    plane=PLANE.new
    tower=CONTROL_TOWER.new
    tower.current_weather='stormy'
    expect(tower.land(plane)).to eq "This is #{tower.airport} Control. Sorry #{plane.airline} flight, we have low visibility on the runway here at #{tower.airport}, maintain holding formation till we can clear you to land. Over..."
  end

    it 'PREVENT TAKE OFF WHEN WEATHER IS STORMY' do
    plane=PLANE.new
    tower=CONTROL_TOWER.new

    tower.current_weather='stormy'
    expect(tower.take_off(plane)).to eq "This is #{tower.airport} Control. Sorry #{plane.airline} flight, we have low visibility on the runway here at #{tower.airport}, maintain holding formation till we can clear you to land. Over..."
  end

    it 'PREVENT LANDING IF AIRPORT IS FULL' do

    tower=CONTROL_TOWER.new
    tower.current_weather='clear'

    CONTROL_TOWER::DEFAULT_CAPACITY.times{

    plane = PLANE.new
    tower.land(plane) }

    plane = PLANE.new
    expect(tower.land(plane)).to eq 'AT CAPACITY'
  end

    it 'SET AIRPORT CAPACITY' do
    expect(subject.capacity).to eq CONTROL_TOWER::DEFAULT_CAPACITY
  end

    context 'forced good weather to allow take off of landed plane'
    it 'CHECK WHEATHER PLANE IS ALREADY AIRBORNE BEFORE TAKE OFF' do

    tower = CONTROL_TOWER.new
    tower.current_weather = 'clear'

    plane=PLANE.new
    expect(tower.take_off(plane)).to eq "This is #{tower.airport} Control. Sorry we already cleared a #{plane.airline} flight matching yours and it is airborne. Check you have your codes correct and we can clear you to land. Over..."
  end

    context 'forced good weather to allow landing of airborne plane'
    it 'check if plane is airborne before allowing it to land' do

    tower = CONTROL_TOWER.new
    plane=PLANE.new
    tower.current_weather='clear'

    expect(tower.land(plane)).to eq [plane]
  end

    it 'check airport is full' do

    subject.current_weather='clear'

    CONTROL_TOWER::DEFAULT_CAPACITY.times{ plane=PLANE.new
    subject.land(plane) }
    expect(subject.full?).to eq true
  end

    it 'check if plane is already on runway' do
    plane=PLANE.new
    subject.current_weather = 'clear'

    subject.land(plane)
    expect(subject.land(plane)).to eq "This is #{subject.airport} Control. Sorry we already have a #{plane.airline} flight matching yours on the runway. Check you have your codes correct and we can clear you to land. Over..."
 end
    it 'check plane that is at one airport cannot land at another' do
    destination=CONTROL_TOWER.new
    plane=PLANE.new
    destination.current_weather='clear'
    destination.land(plane)
    destination2=CONTROL_TOWER.new('JFK')
    destination2.current_weather='clear'
    expect(destination2.land(plane)).to eq "This plane has already landed. Check your codes #{plane.airline}"
  end

    it 'BONUS LAND AND TAKE OFF MULTIPLE PLANES' do
      hangar = []

      hangar << plane1=PLANE.new
      hangar << plane2=PLANE.new
      hangar << plane3=PLANE.new
      hangar << plane4=PLANE.new

      hangar.each{|x| subject.land(x)}

      hangar.each{|x| subject.take_off(x)}

      expect(subject.planes).to eq []
      end
end
