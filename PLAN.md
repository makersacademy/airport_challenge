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
2.7.0 :001 > airport = Airport.new
Traceback (most recent call last):
        4: from /Users/katiemcdonagh/.rvm/rubies/ruby-2.7.0/bin/irb:23:in `<main>'
        3: from /Users/katiemcdonagh/.rvm/rubies/ruby-2.7.0/bin/irb:23:in `load'
        2: from /Users/katiemcdonagh/.rvm/rubies/ruby-2.7.0/lib/ruby/gems/2.7.0/gems/irb-1.2.1/exe/irb:11:in `<top (required)>'
        1: from (irb):1
NameError (uninitialized constant Airport)
```
