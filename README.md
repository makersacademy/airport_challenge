Airport Challenge - WPDUNK Submission
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

Approach
---------

1. Two object classes Airport and Plane
2. Most of the methods fall within the Airport class (will only be applied with consideration of particular to airport)
3. Weather variability applied as method to airport (influences other methods applied to Airport)
*In hindsight Weather might sit better in its own class, would better follow SRP* 


Summary
-----

* Happy with my TDD approach until the edge cases, at this point I found writing
tests hard. Due to the assumptions made previously when attempting to  always write
the simplest code to pass the initial tests.
* In short shielding against the edge cases seamed to add a lot of bulk to the programme
making me second guess my approach.
* I remain unsure how much one can rework older tests when new code begins to break
these unit tests. Ideally if written correctly maybe the first the tests should always pass?
* ^^^ this process of rewriting older tests concerns me that they are no longer as
strong in terms of holding the code to account.
* Still working out how to test for a true random output (i.e. weather check)
