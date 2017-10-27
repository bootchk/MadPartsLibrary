#format 1.2
#name FPC-1mmpitchx4Vert
#id FPC-1mmpitchx4Vert
#desc Amphenol SFW4S-2STME1LF
#desc Connector for flexible, flat ribbon cable
#desc Four pins with 1mm pitch
#desc SMD
#desc Vertical orientation
#desc Mounting pads for mechanical strength

footprint = () ->
  
 
  lineWidth = 0.1

  # Package outline
  packageX = 3.6
  packageY = 10.4

  # Reference placement
  refOffsetY = 6


 # All signal pin attributes
  dx = 1.85
  dy = 0.6

  mechanicalPaddx = 5.5
  mechanicalPaddy = 0.6
 
  # define copper pads for signal pins
  pad = new Smd
  pad.dx = dx
  pad.dy = dy

  mechanicalPad = new Smd
  mechanicalPad.dx = mechanicalPaddx
  mechanicalPad.dy = mechanicalPaddy

  # Pin spacing
  signalPinPitch = 1.0
  mechanicalPinPitch = 5

  betweenPinCenters = 3.6
  stagger = betweenPinCenters / 2

  signalPinCount = 4
  mechanicalPinCount = 2


  # SIP
  signalPins = single   pad, signalPinCount, signalPinPitch

  # stagger
  adjust_x signalPins[0] , -stagger
  adjust_x signalPins[1] , stagger
  adjust_x signalPins[2] , -stagger
  adjust_x signalPins[3] , stagger


  mechanicalPins = single ( clone mechanicalPad),mechanicalPinCount, mechanicalPinPitch

  # Remove pin numbers from mechanical
  mechanicalPins[0].name = ''
  mechanicalPins[1].name = ''
 
  # Mechanical pins still get paste?

  # package outline
  silk = make_rect packageX, packageY, lineWidth, 'silk'

  # ref and value on silk
  name = new Name refOffsetY
  value = new Value -refOffsetY

  # Contact side mark serves as  pin 1 indicator.
  # Pads are symmetrical under rotation but contacts are one sided.
  # The arrow points to the contacts on the cable!!!
  # Or, interpret the arrow as a representation of a contact on the connector.
  contactSideMark = new Label ("<")
  contactSideMark.x = 2.4
  contactSideMark.y = 4

 # No keepout drawn.  Just keep traces off contacts.

  combine [name, value, signalPins,mechanicalPins,  silk, contactSideMark]