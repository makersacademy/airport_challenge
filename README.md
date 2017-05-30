#Airport Challenge# [![Build Status](https://travis-ci.org/makersacademy/airport_challenge.svg?branch=master)](https://travis-ci.org/makersacademy/airport_challenge)
========================

```
         _  _
        ( `   )_
       (    )    `)
     (_   (_ .  _) _)
                                    _
                                   (  )
    _ .                         ( `  ) . )
  (  _ )_                      (_, _(  ,_)_)
(_  _(_ ,)
                                                       |
         _  _                                        \ _ /
        ( `   )_                                   -= (_) =-
       (    )    `)                                  /   \
     (_   (_ .  _) _)                                  |

                                _
                              -=\`\
                          |\ ____\_\__
                        -=\ma""""""" "`)
                           `~~~~~/ /~~`
                             -==/ /
                               '-'                 _
                                                  (  )
                _, _ .                         ( `  ) . )
               ( (  _ )_                      (_, _(  ,_)_)
              (_(_  _(_ ,)

```

This program has 3 classes:


1. Airport

2. Plane

3. Weather


The Airport class can `.land`/`take_off` a plane using the plane object as an argument - calling `.down`/`.up`, respectively, to change the airborne status of the plane object. The Airport will then shovel the plane into/delete it from a hanger array which is where landed planes are stored.

Guard conditions exist to prevent planes from landing when they are not airborne and also from taking off from airports where they are not current at.

The Weather class dictates whether or not it is safe to `.take_off`/`.land` when `.fair?` is called on it by returning `true` and occasionally `false`.

* note: I did try to make the private methods found in `airport_spec.rb` a module, but when implemented the rspec-specific methods returned undefined.
