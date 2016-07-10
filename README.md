#Airport Challenge# [![Build Status](https://travis-ci.org/makersacademy/airport_challenge.svg?branch=master)](https://travis-ci.org/makersacademy/airport_challenge)
========================

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

This program has 3 classes:


1. Airport

2. Plane

3. Weather


The Airport class can `.land`/`take_off` a plane using the plane object as an argument - calling `.down`/`.up`, respectively, to change the airborne status of the plane object. The Airport will then shovel the plane into/delete it from a hanger array which is where landed planes are stored.

Guard conditions exist to prevent planes from landing when they are not airborne and also from taking off from airports where they are not current at.

The Weather class dictates whether or not it is safe to `.take_off`/`.land` when `.fair?` is called on it by returning `true` and occasionally `false`.
