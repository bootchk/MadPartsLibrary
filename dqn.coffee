#format 1.2
#name handXSON-4
#id handXSON-4
#desc hand solderable XSON-4 footprint
#desc based on Texas Instruments DQN

footprint = () ->
  
 
  lineWidth = 0.1

  # hand solderable
  dx = 0.65
  betweenPinCenters = 1.2

  # reflow
  #dx = 0.45
  #betweenPinCenters = 1.0

  dy = 0.3
  pitch = 0.65

  # define copper pads for pins
  pad = new Smd
  pad.dx = dx
  pad.dy = dy

  # pads rounded both ends
  pad.ro = 100
  

  #l = dual [pad,d], 4, pitch, betweenPins
  l = dual [pad], 4, pitch, betweenPinCenters

 
  
  # Rect for pin docs
  #d = new Rect
  # d.type = 'docu'
  # d.dx = 0.6
  # d.dy = 0.51
  # d.x = -(3.2-0.6)/2+betweenPins/2

  # rect for keepout doc
  # docu = make_rect 1.8, 3.1, lineWidth, 'docu'

  # package outline
  silk = make_rect 1, 1, lineWidth, 'silk'

  c = new Circle 0.1
  c.r = 0.2
  c.x = -1.2
  c.y = .4

  name = new Name 1.2
  value = new Value -1.2
  combine [name, value, l, silk, c]