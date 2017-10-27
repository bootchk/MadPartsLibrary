#format 1.2
#name FFC-4-TH
#id FFC-4-TH
#desc Flat Flexible Cable 4 pins, through hole
#desc e.g. Amphenol 58JF

# See dual.
# Two columns of 'unit' elements,  'distance' apart vertically
# and 'between' apart horizontally.
# Total count of elements is 'num' units, must be odd.
# Left column has one more element than right column.
# Right column is staggered from left column
dualStaggered = (unit, num, distance, between) ->
  leftColumnCount = Math.floor((num + 1) / 2)
  unit = make_sure_is_array unit
  s1 = single unit, leftColumnCount, distance
  s1 = s1.map ((item) -> adjust_x (rotate180pad item), -between/2)
  # rightColumn <= flip(clone leftColumn)
  s2 = s1.map ((item) -> rotate180 (clone item))
  # offset rightColumn upwards (staggered from left row)
  offset = distance / 2
  s2 = s2.map ((item) -> adjust_y (item), offset)
  # remove last element of rightColumn
  s2 = remove s2, (leftColumnCount - 1) + 1
  generate_names (combine [s1, s2])

footprint = () ->
  
  lineWidth = 0.1
  
  dx = 0.5
  dy = 0.36
  betweenPinCenters = 1.4
  pitch = 1.0

  # define copper pads for pins
  pad = new Smd
  pad.dx = dx
  pad.dy = dy

  # pads rounded both ends
  #  pad.ro = 100
  
  l = dualStaggered [pad], 3, pitch, betweenPinCenters
  
  # Rect for pin docs
  #d = new Rect
  # d.type = 'docu'
  # d.dx = 0.6
  # d.dy = 0.51
  # d.x = -(3.2-0.6)/2+betweenPins/2

  # rect for keepout doc
  # docu = make_rect 1.8, 3.1, lineWidth, 'docu'

  # package outline
  silk = make_rect 0.8, 1.6, lineWidth, 'silk'

  # No pin 1 designator needed, only one orientation

  name = new Name 1.2
  value = new Value -1.2
  combine [name, value, l, silk]