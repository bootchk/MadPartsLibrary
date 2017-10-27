#format 1.2
#name FPC-1mmpitchx4
#id FPC-1mmpitchx4
#desc AMP TE brand, part 84953-4
#desc Connector for flexible, flat ribbon cable
#desc Four pins with 1mm pitch
#desc Package outline encloses sliding locking tabs in open position

footprint = () ->
  
 
  lineWidth = 0.1

  # Package outline
  packageX = 7.3
  packageY = 11.66

  refOffsetX = -3
  refOffsetY = 7


 # All signal pin attributes
  dx = 2
  dy = 0.65

  mechanicalPaddx = 3.6
  mechanicalPaddy = 2.9
 
  # define copper pads for signal pins
  pad = new Smd
  pad.dx = dx
  pad.dy = dy

  mechanicalPad = new Smd
  mechanicalPad.dx = mechanicalPaddx
  mechanicalPad.dy = mechanicalPaddy

  # Pin spacing
  signalPinPitch = 1.0
  mechanicalPinPitch = 8.76

  signalPinCount = 4
  mechanicalPinCount = 2


  # SIP
  signalPins = single   pad, signalPinCount, signalPinPitch
  adjust_x signalPins , 1

  mechanicalPins = single ( clone mechanicalPad),mechanicalPinCount, mechanicalPinPitch
  adjust_x mechanicalPins , -1.8

  # Remove pin numbers from mechanical
  mechanicalPins[0].name = ''
  mechanicalPins[1].name = ''
 

  # package outline
  silk = make_rect packageX, packageY, lineWidth, 'silk'
  adjust_x silk, -packageX/2


  # ref and value on silk
  name = new Name refOffsetY
  value = new Value -refOffsetY
  adjust_x name, refOffsetX
  adjust_x value, refOffsetX

  # no need for pin 1 indicator, is asymmetrical

  combine [name, value, signalPins,mechanicalPins,  silk]