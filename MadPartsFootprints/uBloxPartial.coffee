#format 1.2
#name uBloxNina-B112Partial
#id uBloxPartial
#desc partial footprint for uBlox NINA-B112 module.
#desc pin numbers do not match module pin numbers.
#desc with partial thermal pads.
#desc !!! Do not route top copper through package outline.
#desc Pins 6, 8, 10, 14, and 15 grounded

footprint = () ->
  
 
  lineWidth = 0.1

  # Package outline
  packageX = 10
  packageY = 10.6

  refOffset = 6
  antennaOffset = 7

  groundNetName = 15

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
  betweenPinRowCenters = 8.25
  pitch = 1
  sidesPinCount = 4

  #side pins dual  i.e. like a DIP
  sidePins = dual [pad], sidesPinCount, pitch, betweenPinRowCenters

  # slide down
  adjust_y sidePins , -4


  # topbottom

  topBottombetweenPinRowCenters = 9
  topBottomPinCount = 10


  # rotated DIP
  
  #bottom = rot_dual  (rotate90pad clone pad), 5, pitch, topBottombetweenPinRowCenters
  bottomPins = rot_dual  pad, topBottomPinCount, pitch, topBottombetweenPinRowCenters
  bottomPins = generate_names bottomPins, sidesPinCount
  # adjust_y bottom , -4.5
 

  # one extra ground pin
  extraGround = single pad, 1, pitch
  #extraGround.x += -5
  adjust_x extraGround , -4.125
  adjust_y extraGround , -0.5
  extraGround[0].name = groundNetName
  



 
  # Thermal pad is set of drilled square throughholes plus pasted SMD pads
  # all with same pin number

  # drill > 13 mil OSHPark minimum
  drill = .33

  thermalPadDim = 0.7

  betweenThermalPadCenters = 1.15
  thermalPadCount = 8

   # Thermal pad
  thermalPad = new Smd thermalPadDim, thermalPadDim
  thermalPad.dx = thermalPadDim
  thermalPad.dy = thermalPadDim


  # arrange in a DIP
  thermalDIP =  dual [thermalPad], thermalPadCount, pitch, betweenThermalPadCenters
 
  

  # Thermal through holes
  thermalThroughHole = new SquarePad thermalPadDim, drill
  # They don't get paste.  They are invisible beneath the pasted SMD pads.
  thermalThroughDIP =  dual [thermalThroughHole], thermalPadCount, pitch, betweenThermalPadCenters



  # All grounded pins same name (network)
  bottomPins[1].name = groundNetName
  bottomPins[3].name = groundNetName
  bottomPins[5].name = groundNetName
  bottomPins[9].name = groundNetName
  for pin in thermalDIP
    pin.name = groundNetName
  for pin in thermalThroughDIP
     pin.name = groundNetName 
  

  # package outline
  silk = make_rect packageX, packageY, lineWidth, 'silk'


  # antenna outline
  antennaY = 3.4
  antennaSilk = make_rect packageX, antennaY, lineWidth, 'silk'
  adjust_y antennaSilk , -antennaOffset
  


  # Pin 1 mark
  # !!! Pin 1 of module, not pin 1 of footprint
  c = new Circle 0.1
  c.r = 0.2
  c.x = -6
  c.y = 5

  name = new Name refOffset 
  value = new Value -refOffset - 4
  combine [name, value, sidePins, bottomPins, extraGround, silk, antennaSilk, c, thermalDIP, thermalThroughDIP]