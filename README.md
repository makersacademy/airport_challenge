Airport Challenge
------------------
Folder Tree:
── lib
│   ├── airport.rb
│   ├── plane.rb
│   └── weather.rb
└── spec
    ├── airport_spec.rb
    ├── plane_spec.rb
    ├── spec_helper.rb
    └── weather_spec.rb

Aim
----
Implement a very basic software to control the flow of planes at an airport. As such, it was necessary to create three different classes: Airport, Plane and Weather, that will interact with one another, as well as method such as land and take_off and variables as capacity and number of planes at the airport at the time.

Code Snippet
------------

London  = Airport.new
=> #<Airport:0x007fa540a2db08 @capacity=10, @planes=[]>

Boeing = Plane.new
=> #<Plane:0x007fa541213430>

London.land Boeing
=> [#<Plane:0x007fa541213430>]

London.planes
=> [#<Plane:0x007fa541213430>]

London.take_off(Boeing)
=> #<Plane:0x007fa541213430>

By
--
Emilio Menendez
