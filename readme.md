Some MadParts electronic part footprint definitions for EDA e.g. KiCad, Eagle.  Also known as lands or library symbols.

Provided as-is, you should check them yourselves.

MadParts is a great way of defining footprints.  The language is compact and parametric or declarative rather than procedural.  If you don’t like the GUI symbol editor’s in KiCad, try MadParts.  You type parameters in a ‘program’ in one window, and immediately see the footprint in another window.

https://madparts.org

Contents:

   MadPartsFootprints/  directory of definition files in MadParts language
   myFootprints.pretty/ directory of footprint files in KiCad format, generated from the above

(Some of the footprints were not generated from MadParts, but using the KiCad footprint editor)

Here I discuss the footprints in general.  Mostly SMD footprints.  Basic footprints, lacking in some amenities, such as keepouts.  Often including a thermal pad, numbered and usually grounded, that some people might consider extra and creating an odd number of pins.  Many footprints are for TI parts.  Some of the footprints are SMD but with extra long pads for hand soldering.

To find a footprint for a part number or package name you might need, grep the MadPartsFootprints directory: the name of the file is not always indicative and usually industry standard names and part numbers are in the definition.

QFN Quad Flat No lead, TI MSP430

WSON very Small Outline No lead  TI DRV10866 BLDC motor driver, TI TPS22860 load switch, etc.

DQN is TI nomenclature for their 4-pin XSON package, TI TPS3839 voltage supervisor.  A very weird footprint, here altered for hand-soldering and no thermal pad (only for low currents, low mechanical stress.)

Various footprints for 2.4Ghz radio modules from uBlox, Waveshare.

AM1417 Amorton indoor solar cell, SMD footprint.

FPC AMP TE brand, female connector for flat cable, top contact, lockable as found on some motors.
