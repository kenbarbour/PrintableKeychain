# PrintableKeychain
3d-printable swiss-army style keychain with a spring-loaded pocket clip.

## Model Generation

The .scad files in this project were created for OpenSCAD.  Make sure you have openscad and make installed and use the
following command to generate the models needed to print:
``make all``

Alternatively, you can open any of the files described below in OpenSCAD and generate the parts manually.

## Files
### SCAD Part Files
* **keychain_bottom.scad** - The bottom portion of the keychain that receives the M3 socket-head screw
* **keychain_top.scad** - The top portion of the keychain that captures the M4 nut and the clip
* **keychain_clip.scad** - Clip that holds the keychain in place in your pocket

### Other SCAD Files
* **measurements.scad** - Document containing measurements for the 3d printed parts
* **lib.scad** - Some functions used to generate the parts

### Other files
* **Makefile** - used by __make__ to generate models.  Use the command ``make all`` to generate models

## Required Hardware
* (2) M3 Socket Head screw (length varies, depending on the number of keys)
* (1) M3*? Socket Head screw - for attaching the clip
* (1) Small (about 3mm OD * 10mm length) pen spring - for the spring loaded clip
* (n+2) M3 washers (where n = number of keys) - between keys and top/bottom

## Assembly Instructions
  1. Insert M3 nuts into __keychain_top__ by tightening the M3 screw with a washer from the inside of the __keychain_top__.  Don't forget the nut for the clip clevis.
  2. Sandwich the keys between the __keychain_top__ and __keychain_bottom__, placing a washer between the keys and the printed part and between each key.
  3. Screw the __keychain_bottom__ into the __keychain_top__ tight enough so that the keys don't flop around,  but loose enough so that they can be folded out easily.
  4. With the spring seated in the spring boss on the __keychain_top__, attach the __keychain_clip__ with another M3 screw, being careful not to overtighten and break the part.
