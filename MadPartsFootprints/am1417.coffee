#format 1.2
#name AM1417
#id AM1417
#desc surface mount pads for Amorton solar cell 35x14mm2.4V
#desc for the CA version (presoldered wires, to be removed for surface mount)



footprint = () ->
  
  lineWidth = 0.1
  
  pinWidth = 3.2
  pinHeight = 1.8
  betweenPinCenters = 31
  pitch = 1.0
  pinCount = 2

  p1x = -15.5
  p2x = 15.5

  # originally 5.8, moved down .4
  py = 5.5

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

  # pads rounded both ends
  # pad.ro = 100


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
  packageWidth = 35
  packageHeight = 13.9
  outLine = make_rect packageWidth, packageHeight, lineWidth, 'silk'

  # package outline is a series of lines: abortive attempt to move it
  #outLine.dx = packageWidth
  #outLine.dy = packageHeight
  #outLine.map ((o) ->
  #     o.dy = 5
   #    o)
  # outLine.y = 5

  # Pin 1 designator
  # Positive +
  c = new Circle 0.1
  c.r = 0.2
  c.x = -13
  c.y = 6

  name = new Name 1.2
  name.y = py
  value = new Value -1.2
  combine [name, value, pad, pad2, padTH, padTH2, outLine, c]