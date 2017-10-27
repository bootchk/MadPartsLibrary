#format 1.2
#name AVX_SCM_Series_2_5F
#id AVX_SCM_Series_2_5F
#desc TH 2 pins 0.6mm 15.5mm apart


footprint = () ->
 
  lineWidth = 0.1

  pinCount = 2

  # same as 0.05inch
  pitch = 15.5
 
  # Pins are 0.65 max
  # Add 0.25
  drillDiameter = 0.675
  
  # radius 0.5 => annulus of 0.3mm, clearance 0.27mm between pads
  # radius 0.52 => annulus of 0.17mm, clearance 0.24mm between pads
  padDiameter = drillDiameter + 0.7
  radius = padDiameter /2
  
  # define copper pads for pins
  pad = new RoundPad radius, drillDiameter

  #pad = new LongPad 2*radius, drillDiameter
  # pads rounded both ends
  pad.ro = 100
  
  # two rows of regular pins
  pads = single [pad], pinCount, pitch

  # package outline
  packageWidth = 10
  packageHeight = 20

  silk = make_rect packageWidth, packageHeight, lineWidth, 'silk'

  nameValueOffset = 3
  name = new Name nameValueOffset + 0.2
  value = new Value -nameValueOffset
  combine [name, value, pads, silk]
