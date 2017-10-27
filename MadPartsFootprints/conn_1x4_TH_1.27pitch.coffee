#format 1.2
#name conn_1x4_1.27pitch
#id conn_1x4_1.27pitch
#desc 4 pins, single row header, pitch 1.27mm
#desc Maker: Sullins Model: LPPB501NFFN-RC
#desc male header  or female socket
#desc pins are 0.40mm diameter

footprint = () ->
 
  lineWidth = 0.1

  pinCount = 4

  # same as 0.05inch
  pitch = 1.27
 
  # spec is 0.70 +- .05
  drillDiameter = 0.65
  
  # radius 0.5 => annulus of 0.15mm, clearance 0.27mm between pads
  # radius 0.52 => annulus of 0.17mm, clearance 0.24mm between pads
  radius = 0.50
  
  # define copper pads for pins
  pad = new OctagonPad radius, drillDiameter

  pad = new LongPad 2*radius, drillDiameter
  # pads rounded both ends
  pad.ro = 100
  
  # two rows of regular pins
  pads = single [pad], pinCount, pitch

  # package outline
  packageWidth = 2.2
  packageHeight = pinCount * pitch

  silk = make_rect packageWidth, packageHeight, lineWidth, 'silk'

  nameValueOffset = 3
  name = new Name nameValueOffset + 0.2
  value = new Value -nameValueOffset
  combine [name, value, pads, silk]
