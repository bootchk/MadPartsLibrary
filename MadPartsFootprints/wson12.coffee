#format 1.2
#name wson12
#id wson12
#desc 12 pins, "Small Outline No lead",  W means very small
#desc based on Texas Instruments package named: DSS
#desc package outline 2x3mm
#desc typical maker: TI, part number: DRV8835

footprint = () ->
  
 
  lineWidth = 0.1
  pinCount = 12

  # hand solderable
  dx = 0.6
  betweenPinCenters = 2

  # reflow
  #dx = 0.5
  #betweenPinCenters = 1.9

  dy = 0.28
  pitch = 0.5

  # define copper pads for pins
  pad = new Smd
  pad.dx = dx
  pad.dy = dy

  # pads rounded both ends
  # pad.ro = 100
  
  # two rows of regular pins
  pinPads = dual [pad], pinCount, pitch, betweenPinCenters

 
 
  # drill > 13 mil OSHPark minimum
  drill = .33

   # Thermal pad
  thermalPad = new SquarePad 2, drill
  thermalPad.dx = .9
  thermalPad.dy = 1
  thermalPad.name = 13
  thermalPad.paste = true
  # !! no effect, later make paste in footprint editor

  thermalPad2 = clone(thermalPad)
  thermalPad2.y = 1
  thermalPad3 = clone(thermalPad)
  thermalPad3.y = -1

  #extra thermal vias
  #thermalVia1 = new Hole(drill)
  #thermalVia1.y = 1


  # thermal paste
  # paste 70% * 0.9 = 0.63
  thermalPaste = new Smd
  thermalPaste.dx = .65
  thermalPaste.dy = 3
  thermalPaste.name = 13

  # package outline
  packageWidth = 2
  packageHeight = 3
  silk = make_rect  packageWidth, packageHeight, lineWidth, 'silk'

  # pin one designator
  c = new Circle 0.1
  c.r = 0.2
  pinOneOffset = 1.4
  c.x = -pinOneOffset
  c.y = pinOneOffset + 0.2

  # name and value texts
  nameValueOffset = 2
  name = new Name nameValueOffset + 0.4	
  value = new Value -nameValueOffset

  combine [name, value, pinPads, thermalPad, thermalPad2, thermalPad3, thermalPaste, silk, c]
