#format 1.2
#name Wavesharenrf51822CoreB
#id WaveshareNRF51822CoreB
#desc Waveshare brand, model nrf51822CoreB
#desc Pin numbers do not match module pin numbers.
#desc Pin numbering unconventional.
#desc !!! Can route top copper through package outline.
#desc Pins 1, 11 ground

footprint = () ->
  
 
  lineWidth = 0.1

  # Package outline
  # Pin centers on edge of outline
  packageX = 17
  packageY = 20.8

  refOffset = 12
  antennaOffset = 7.9


 # All non-thermal pins
 # Pin attributes
  dx = 1.15
  dy = 0.7
 
  # define copper pads for pins
  pad = new Smd
  pad.dx = dx
  pad.dy = dy


 
  # sides

  # Pin spacing
  betweenPinRowCenters = 17
  pitch = 1.1

  # Pin counts
  edgePinCount = 48
  sidePinCount = 24
  bottomPinCount = 12

  #side pins dual  i.e. like a DIP
  sidePins = dual [pad], sidePinCount, pitch, betweenPinRowCenters

  #bottom and side pins implemented as quad with deletions
  # This doesn't work because pins not symmetric
  edgePins = quad [pad], edgePinCount, pitch, betweenPinRowCenters

  # slide down
  adjust_y sidePins , -1.25




  # bottom is rotated SIP

  bottomPinCount = 12
 
  bottomPins = rot_single   (rotate90pad clone pad), bottomPinCount, pitch
  bottomPins = generate_names bottomPins, sidePinCount
  adjust_y bottomPins , -10.4
 

  # package outline
  silk = make_rect packageX, packageY, lineWidth, 'silk'


  # antenna keepout outline
  antennaY = 5
  antennaSilk = make_rect packageX, antennaY, lineWidth, 'silk'
  adjust_y antennaSilk , antennaOffset
  

  # No thermal pad
  # No Pin 1 mark  needed, package is assymetrical


  name = new Name refOffset 
  value = new Value -refOffset
  combine [name, value, sidePins, bottomPins, silk, antennaSilk]