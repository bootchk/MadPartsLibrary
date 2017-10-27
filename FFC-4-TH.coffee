#format 1.2
#name FFC-4-TH
#id FFC-4-TH
#desc Flat Flexible Cable 4 pins, through hole
#desc e.g. Amphenol 58JF

# Offset odd pins left and right
stagger_x = (item, index, offset) ->
  if index % 2 == 1
     adjust_x (item), offset
  else
    adjust_x (item),- offset

# Numbered in single column.
# Right column is staggered from left column
singleStaggered = (unit, num, pitch, between) ->
  unit = make_sure_is_array unit

  pins = single unit, num, pitch
  
  # stagger odd pins by half between
  for item, index in pins
    stagger_x(item, index, between/2)
    
  #generate_names (pins)

footprint = () ->
  
  lineWidth = 0.1

  packageDx = 4
  packageDy = 10.2

  pinCount = 4

  drill = 0.8
  ringRadius = 0.6

  refOffset = 6
  
  betweenPinCenters = 2
  pitch = 1

  # define pins
  pad = new RoundPad ringRadius, drill
  
  l = singleStaggered [pad], pinCount, pitch, betweenPinCenters

  # package outline
  silk = make_rect packageDx, packageDy, lineWidth, 'silk'

  # No pin 1 designator needed: invariant under rotation by 180 degrees
  # Rotate at design time so contacts meet contact side of cable.

  name = new Name refOffset
  value = new Value -refOffset
  combine [name, value, l, silk]