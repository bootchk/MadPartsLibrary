#format 1.2
#name tssop14
#id tssop14
#desc 8 pins, "Thin-Shrink Small Outline Plastic"
#desc based on Texas Instruments package named: PW
#desc package outline 5x4.5mm
#desc Typical part Texas Instruments MSP430F2012
#desc Discrepancy from TI recommendations: rounded pads

footprint = () ->
  
 
  lineWidth = 0.1

  pinCount = 14

  # hand solderable
  #dx = 0.7
  #betweenPinCenters = 1.2

  # reflow
  padX = 1.6
  betweenPinCenters = 5.6

  padY = 0.35
  pitch = 0.65

  # define copper pads for pins
  pad = new Smd
  pad.dx = padX
  pad.dy = padY

  # pads rounded both ends
  # rounded pads stencil with less paste lift
  pad.ro = 100
  
  # two rows of regular pins
  pins = dual [pad], pinCount, pitch, betweenPinCenters
  
  # rect for keepout doc
  # docu = make_rect 1.8, 3.1, lineWidth, 'docu'

  # package outline
  packageWidth = 4.5
  packageHeight = 5.0
  silk = make_rect packageWidth, packageHeight, lineWidth, 'silk'

  # pin 1 designator
  c = new Circle 0.1
  c.r = 0.2
  pinOneOffset = 3.0
  c.x = -pinOneOffset
  c.y = pinOneOffset


 # Value and Reference texts
  nameValueOffset = 3
  name = new Name nameValueOffset + 0.2	
  value = new Value -nameValueOffset - 0.2

  combine [name, value, pins, silk, c]
