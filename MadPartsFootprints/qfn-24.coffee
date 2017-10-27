#format 1.2
#name QFN-24
#id QFN-24
#desc hand solderable QFN-16 footprint
#desc based on Texas Instruments RGE (VQFN-24)
# with thermal pad pin

footprint = () ->
  
 
  lineWidth = 0.1

  # Package outline
  packageDim = 4
  refOffset = 3

 
  # Pin spacing
  betweenPinCenters = 4
  pitch = 0.5
  pinCount = 24


  # Pin attributes
  # hand solderable
  # Really are .85, but fudge for ease of centering
  dx = 0.9
  
  # reflow
  #dx = 0.45
  #betweenPinCenters = 1.0

  dy = 0.28
 
  # define copper pads for pins
  pad = new Smd
  pad.dx = dx
  pad.dy = dy

  # pads rounded both ends
  pad.ro = 100
  

  
  l = quad [pad], pinCount, pitch, betweenPinCenters

 
  # Thermal pad is set of drilled square throughholes plus pasted SMD pads
  # all with same pin number

  # drill > 13 mil OSHPark minimum
  drill = .33

  thermalPadDim = 1.3
  thermalPadOffset = .65
  thermalPadName = 25

   # Thermal pad
  thermalPad = new SquarePad thermalPadDim, drill
  thermalPad.x = -thermalPadOffset
  thermalPad.y = -thermalPadOffset
  thermalPad.name = thermalPadName
  thermalPad.paste = true
  # !! no effect, later make paste in footprint editor
  # Or as below, use SMD pads

  # arrange in a quad
  thermalPad2 = clone(thermalPad)
  thermalPad2.y = thermalPadOffset

  thermalPad3 = clone(thermalPad)
  thermalPad3.x = thermalPadOffset

  thermalPad4 = clone(thermalPad)
  thermalPad4.x = thermalPadOffset
  thermalPad4.y = thermalPadOffset


  # thermal paste
  # paste 70% * 0.9 = 0.63
  thermalPasteOffset = 0.7
  thermalPaste = new Smd
  thermalPaste.dx =1
  thermalPaste.dy = 2.4
  thermalPaste.x = -0.7
  thermalPaste.name = thermalPadName

  thermalPaste2 = clone(thermalPaste)
  thermalPaste2.x = thermalPadOffset
  
  # Rect for pin docs
  #d = new Rect
  # d.type = 'docu'
  # d.dx = 0.6
  # d.dy = 0.51
  # d.x = -(3.2-0.6)/2+betweenPins/2

  # rect for keepout doc
  # docu = make_rect 1.8, 3.1, lineWidth, 'docu'

  # package outline
  silk = make_rect packageDim, packageDim, lineWidth, 'silk'

  # Pin 1 mark
  c = new Circle 0.1
  c.r = 0.2
  c.x = -2
  c.y = 2

  name = new Name refOffset + 0.5
  value = new Value -refOffset
  combine [name, value, l, silk, c, thermalPad, thermalPad2, thermalPad3, thermalPad4, thermalPaste, thermalPaste2]