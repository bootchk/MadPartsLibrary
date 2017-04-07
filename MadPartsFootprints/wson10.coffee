#format 1.2
#name wson10
#id wson10
#desc 10 pins, "Small Outline No lead",  W means very small
#desc based on Texas Instruments package named: DSC
#desc package outline 3x3mm
#desc typical maker: TI, part number: DRV10866

footprint = () ->
  
 
  lineWidth = 0.1
  pinCount = 10
  # All thermal pad components, same pin name e.g. 11
  thermalPadName = pinCount + 1

  # hand solderable
  # pin is 0.5 length from package edged, so dx is 1
  # This will get paste and wick up packages orthogonal metal
  # but might wick under chip and lift it?
  dx = 1
  betweenPinCenters = 3

  # reflow
  #dx = 0.5
  #betweenPinCenters = 1.9

  # TI says 0.3-0.18
  dy = 0.28
  pitch = 0.5

  # define copper pads for pins
  pad = new Smd
  pad.dx = dx
  pad.dy = dy

  # pads rounded both ends
  pad.ro = 100
  
  # two rows of regular pins
  pinPads = dual [pad], pinCount, pitch, betweenPinCenters

 
 
  # drill > 13 mil OSHPark minimum
  drill = .33

   # Thermal pad: square through hole pad  w/ drill
  thermalPad = new SquarePad 2, drill
  thermalPad.dx = 1.65
  thermalPad.dy = 1
  thermalPad.name = thermalPadName
  thermalPad.paste = true
  # !! no effect on TH, later make paste in footprint editor
  # Or see below, extra pads for past

  # Count is 3 (TI shows six)
  thermalPad2 = clone(thermalPad)
  thermalPad2.y = 1
  thermalPad3 = clone(thermalPad)
  thermalPad3.y = -1


  # thermal paste

  # SMD pads slightly smaller than TH pads
  # actual pad is 1.65x2.38, 4mm squared
  # extend it out top and bottom
  # paste 70% * 4 = 3 mm squared
  # 3mm squared / 2.4 is 1.25 dx
  thermalPaste = new Smd
  thermalPaste.dx = 1.25
  thermalPaste.dy = 2.38
  thermalPaste.name = thermalPadName
  # !!! Since SMD, will get paste

  # package outline
  packageWidth = 3
  packageHeight = 3
  silk = make_rect  packageWidth, packageHeight, lineWidth, 'silk'

  # pin one designator
  c = new Circle 0.1
  c.r = 0.2
  pinOneOffset = 1.7
  c.x = -pinOneOffset
  c.y = pinOneOffset + 0.2

  # name and value texts
  nameValueOffset = 2
  name = new Name nameValueOffset + 0.4	
  value = new Value -nameValueOffset

  combine [name, value, pinPads, thermalPad, thermalPad2, thermalPad3, thermalPaste, silk, c]
