#format 1.2
#name IXYS_KXOB22
#id  IXYS_KXOB22
#desc surface mount pads for IXYS solar cell 35x14mm
#desc various voltages: 0.5V, 1.5V, ...
#desc  surface mount, reflowable



footprint = () ->
  
  lineWidth = 0.1
  
  pinWidth = 2.5
  pinHeight = 6
  # part pin centers are 20 apart
  # footprint pads are .5 wider and centers are .5 more apart
  betweenPinCenters = 20.5
  pitch = 1.0
  pinCount = 2

  p1x = -betweenPinCenters/2
  p2x = -p1x


  py = 0

  # define copper pads for pins
  pad = new Smd
  pad.dx = pinWidth
  pad.dy = pinHeight

  pad.x = p1x
  pad.y = py

  pad2 = new Smd
  pad2.dx = pinWidth
  pad2.dy = pinHeight

  pad2.x = p2x
  pad2.y = py

 


  # TH for back solder gun

  # !!! Too small for real pins
  drillDiameter = 0.4
  
  # radius 0.5 => annulus of 0.3mm, clearance 0.27mm between pads
  # radius 0.52 => annulus of 0.17mm, clearance 0.24mm between pads
  radius = 0.50
  

  padTH = new RoundPad radius, drillDiameter
  padTH.x = p1x
  padTH.y = py
  padTH.name = 1

  padTH2 = new RoundPad radius, drillDiameter
  padTH2.x = p2x
  padTH2.y = py
  padTH2.name = 2

  
  # l = dual pad, pinCount, pitch, betweenPinCenters
  

  # package outline
  packageWidth = 22
  packageHeight =7
  outLine = make_rect packageWidth, packageHeight, lineWidth, 'silk'



  # Pin 1 designator
  # Positive +
  c = new Circle 0.1
  c.r = 0.2
  c.x = -8
  c.y = 3

  name = new Name 1.2
  name.y = py
  value = new Value -1.2
  combine [name, value, pad, pad2, padTH, padTH2, outLine, c]