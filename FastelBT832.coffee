#format 1.2
#name FastelBT832
#id FastelBT832
#desc Fastel brand, model BT832, BT832A, etc.
#desc Pin numbers  match module pin numbers, up to the BGA
#desc !!! Can route top copper through package outline.
#desc Five pins are ground, ID 8

footprint = () ->
  
 
  lineWidth = 0.1

  # Package outline (exclusive of antenna)
  # Pin centers on edge of outline
  packageX = 14
  packageY = 10

  refOffset = 12
  valueOffset = 6
  antennaOffset = 8


 # All non-thermal pins
 # Pin attributes
 # Pins are castellated, pads extend out from package outline
 # so they can be hand soldered
  dx = 1.5
  dy = 0.7
 
  # define copper pads for castellated pins
  pad = new Smd
  pad.dx = dx
  pad.dy = dy

  # round copper pads for LGA pins
  lgaPadDiameter = 0.6
  lgaPad = new Smd
  lgaPad.dx = lgaPadDiameter
  lgaPad.dy = lgaPadDiameter
  lgaPad.ro = 100

 
  # sides

  # Pin spacing
  # Centered on package outline
  betweenPinRowCenters = packageX
  pitch = 1.1

  # Pin counts
  # edgePinCount = 48
  sidePinCount = 16
  bottomPinCount = 12

  #side pins dual  i.e. like a DIP
  sidePins = dual [pad], sidePinCount, pitch, betweenPinRowCenters

  # Pin groups centered vertically, do not slide down
  # adjust_y sidePins , -1.25


  # Four of LGA pads grounded
  # Other LGA pads omitted
  # Implement as rotated SIP

 # Serve as heat sink?  
 # The module sinks its own heat without needing thermal to PCB
 # If you want more heat sink, via in pad to back ground plane.
 # Or redefine these as TH pads

  groundPinCount = 4
  groundPinOffsetY = 3
  groundNetName = 10
 
  groundPins = rot_single   lgaPad, groundPinCount, pitch

  groundPins[0].name = groundNetName
  groundPins[1].name = groundNetName
  groundPins[2].name = groundNetName
  groundPins[3].name = groundNetName
  #groundPins = generate_names groundPins, sidePinCount

  adjust_y groundPins , groundPinOffsetY
 


  # silkscreen layer drawing

  # package outline
  silk = make_rect packageX, packageY, lineWidth, 'silk'

  # antenna keepout outline
  antennaY = 6
  antennaSilk = make_rect packageX, antennaY, lineWidth, 'docu'
  adjust_y antennaSilk , antennaOffset

  antennaKeepoutText = new Label "!!Antenna"
  antennaKeepoutTextOffset = 8
  antennaKeepoutText.type = "docu"
  adjust_y antennaKeepoutText , antennaKeepoutTextOffset
  

  # keepout for omitted LGA pins
  # each LGA pin is inside a 1.2mm square
  lpaPinDim = 1.2
  lgaKeepoutX = lpaPinDim * 4	# 4 columns
  lgaKeepoutY = lpaPinDim * 5	# 5 rows
  lgaKeepoutOffset = lpaPinDim / 2
  lgaKeeputSilk = make_rect lgaKeepoutX, lgaKeepoutY, lineWidth, 'docu'
  adjust_y lgaKeeputSilk , -lgaKeepoutOffset

  lgaKeepoutText = new Label "!!LGA"
  lgaKeepoutText.type = "docu"


  # No thermal pad
  # No Pin 1 mark  needed, package is assymetrical


  name = new Name refOffset 
  value = new Value -valueOffset
 
  combine [name, value, sidePins, groundPins, silk, antennaSilk, lgaKeeputSilk, lgaKeepoutText, antennaKeepoutText]