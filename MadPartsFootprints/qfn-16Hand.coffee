#format 1.2
#name QFN-16Hand
#id QFN-16Hand
#desc hand solderable QFN-16 footprint
#desc Honeywell HMC5883L
# no thermal pad 

footprint = () ->
  
 
  lineWidth = 0.1

  # Package outline
  packageDim = 3
  refOffset = 2

 
  # Pin spacing
  betweenPinCenters = 3
  pitch = 0.5
  pinCount = 16


  # Pin attributes
  # hand solderable
  # Really are .85, but fudge for ease of centering
  dx = 0.9
  
  # reflow
  #dx = 0.45
  #betweenPinCenters = 1.0

  dy = 0.28
 
  # define copper pads for pins
  pad = new Smd
  pad.dx = dx
  pad.dy = dy

  # pads rounded both ends
  pad.ro = 100
  

  
  l = quad [pad], pinCount, pitch, betweenPinCenters

 
  
  # Rect for pin docs
  #d = new Rect
  # d.type = 'docu'
  # d.dx = 0.6
  # d.dy = 0.51
  # d.x = -(3.2-0.6)/2+betweenPins/2

  # rect for keepout doc
  # docu = make_rect 1.8, 3.1, lineWidth, 'docu'

  # package outline
  silk = make_rect packageDim, packageDim, lineWidth, 'silk'

  # Pin 1 mark
  c = new Circle 0.1
  c.r = 0.2
  c.x = -2
  c.y = 2

  name = new Name refOffset + 0.5
  value = new Value -refOffset
  combine [name, value, l, silk, c]