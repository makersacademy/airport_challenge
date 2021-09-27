Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

The only feature I haven't had the time to implement yet is the feature where planes aren't landing/taking off if the weather is stormy. The way I would approach doing that, I believe, would be to create a seperate weather.rb file with a weather classe that would take an instance variable @weather = true or false in reference to stormy. I would use an attribute reader to access that value outside of the weather class/file and would call it on airports. If weather = true then raise an error if a Plane instance tries to take off or land 