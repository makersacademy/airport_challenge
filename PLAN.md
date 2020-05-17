# Airport Challenge Plan
Breaking down user stories into their objects and messages

## User stories 1

As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

| Objects | Messages |
|:------:|:------: |
| Airport | land |
| Plane |      |

Airport <=> land <=> Plane

## Feature tests - create an Airport object

```shell
$ irb
2.7.0 :001 > airport = Airport.new
Traceback (most recent call last):
        4: from /Users/katiemcdonagh/.rvm/rubies/ruby-2.7.0/bin/irb:23:in `<main>'
        3: from /Users/katiemcdonagh/.rvm/rubies/ruby-2.7.0/bin/irb:23:in `load'
        2: from /Users/katiemcdonagh/.rvm/rubies/ruby-2.7.0/lib/ruby/gems/2.7.0/gems/irb-1.2.1/exe/irb:11:in `<top (required)>'
        1: from (irb):1
NameError (uninitialized constant Airport)
```

## Feature tests - Airport object created

```shell
$ irb
2.6.5 :001 > require './lib/airport'
 => true
2.6.5 :002 > airport = Airport.new
 => #<Airport:0x00007fd12d90f438>
 ```

 ## Feature tests - create land method option for Airport class

 ```shell
$ irb
2.6.5 :001 > require './lib/airport'
 => true
2.6.5 :002 > airport = Airport.new
 => #<Airport:0x00007fc298861340>
2.6.5 :003 > airport.land
Traceback (most recent call last):
        4: from /Users/katiemcdonagh/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `<main>'
        3: from /Users/katiemcdonagh/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `load'
        2: from /Users/katiemcdonagh/.rvm/rubies/ruby-2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        1: from (irb):3
NoMethodError (undefined method `land' for #<Airport:0x00007fc298861340>)
```

## Feature tests - .land method created

```shell
$ irb
2.6.5 :001 > require './lib/airport'
 => true
2.6.5 :002 > airport = Airport.new
 => #<Airport:0x00007fddaa112dc8>
2.6.5 :003 > airport.land
 => nil
 ```

## Feature tests - create Plane object to .land into Airport class

```shell
$ irb
2.6.5 :001 > require './lib/airport'
 => true
2.6.5 :002 > airport = Airport.new
 => #<Airport:0x00007fddaa112dc8>
2.6.5 :003 > airport.land
 => nil
2.6.5 :004 > plane = Plane.new
Traceback (most recent call last):
        4: from /Users/katiemcdonagh/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `<main>'
        3: from /Users/katiemcdonagh/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `load'
        2: from /Users/katiemcdonagh/.rvm/rubies/ruby-2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        1: from (irb):4
NameError (uninitialized constant Plane)'
```

## Feature tests - Plane object created

```shell
irb
2.6.5 :001 > require './lib/plane'
 => true
2.6.5 :002 > plane = Plane.new
 => #<Plane:0x00007fcad2072610>
 ```
