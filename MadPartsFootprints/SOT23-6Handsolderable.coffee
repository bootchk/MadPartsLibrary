#format 1.2
#name SOT23-6Handsolderable
#id SOT23-6Handsolderable
#desc 6 pins, "Small Outline Transistor"
#desc based on Texas Instruments package named: DBV
#desc Typical part Texas Instruments TPS22860
#desc Discrepancy from TI recommendations: rounded pads

footprint = () ->
  
 
  lineWidth = 0.1

  pinCount = 6
  # narrow dimension of pad
  padY = 0.6
  pitch = 0.95

  # hand solderable extra length pad
  padX = 1.5
  betweenPinCenters = 3.2

  # reflow
  #padX = 1.05
  #betweenPinCenters = 2.7

  

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
  packageWidth = 1.75
  packageHeight = 3.0
  silk = make_rect packageWidth, packageHeight, lineWidth, 'silk'

  # pin 1 designator
  c = new Circle 0.1
  c.r = 0.2
  pinOneOffset = 2.0
  c.x = -pinOneOffset
  c.y = pinOneOffset


 # Value and Reference texts
  nameValueOffset = 2
  name = new Name nameValueOffset + 0.2	
  value = new Value -nameValueOffset - 0.2

  combine [name, value, pins, silk, c]
