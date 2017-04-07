#format 1.2
#name wson8
#id wson8
#desc 8 pins, "Small Outline No lead",  W means very small
#desc based on Texas Instruments package named: DSG
#desc package outline 2x2mm

footprint = () ->
  
 
  lineWidth = 0.1

  # hand solderable
  #dx = 0.7
  #betweenPinCenters = 1.2

  # reflow
  dx = 0.5
  betweenPinCenters = 1.9

  dy = 0.28
  pitch = 0.5

  # define copper pads for pins
  pad = new Smd
  pad.dx = dx
  pad.dy = dy

  # pads rounded both ends
  # pad.ro = 100
  
  # two rows of regular pins
  l = dual [pad], 8, pitch, betweenPinCenters

 
  # Thermal pad
  # drill > 13 mil OSHPark minimum
  drill = .33
  thermalPad = new SquarePad 2, drill
  #thermalPad = new Smd
  thermalPad.dx = .9
  thermalPad.dy = 1.6
  thermalPad.name = 4
  thermalPad.paste = true
 
  # Group for thermal pad has one pad
  ##thermalPadGroup = single thermalPad, 1, 1
 ## thermalPadGroup[0].name = 4
  
  # Rect for pin docs
  #d = new Rect
  # d.type = 'docu'
  # d.dx = 0.6
  # d.dy = 0.51
  # d.x = -(3.2-0.6)/2+betweenPins/2

  # rect for keepout doc
  # docu = make_rect 1.8, 3.1, lineWidth, 'docu'

  # package outline
  squarePackageRadius = 2
  silk = make_rect squarePackageRadius, squarePackageRadius, lineWidth, 'silk'

  c = new Circle 0.1
  c.r = 0.2
  pinOneOffset = 1.4
  c.x = -pinOneOffset
  c.y = pinOneOffset


  nameValueOffset = 2
  name = new Name nameValueOffset + 0.2	
  value = new Value -nameValueOffset
  combine [name, value, l, thermalPad, silk, c]
