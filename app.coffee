#Set the default animation to spring
Framer.Defaults.Animation =
	time: .30
	curve: 'spring'
	curveOptions:
		tension: 200
		friction: 20
		velocity: 5


# Add a background layer
bg = new BackgroundLayer
	backgroundColor: 'lightgrey'
	

# Create variables
animationTime = .1

ballClosedDiameter = 30
ballOpenDiameter = 80
buttonActive = false

navbarOpenHeight = 400
navbarClosedHeight = 3


#Create navbar
navbar = new Layer
	width: bg.width
	height: navbarClosedHeight
	backgroundColor: 'goldenrod'	


# Create button
button = new Layer
	width: ballClosedDiameter
	height: ballClosedDiameter
	
button.style =
	border: '15px solid white'
	backgroundColor: bg.backgroundColor
	borderRadius: '50%'

button.centerX()
button.y = 60



# Create Click Event to toggle functions
button.on Events.Click, ->
	if buttonActive then close() else open()
	
# Open function
open = ->
	buttonActive = true

	button.animate
		properties: 
			width: ballOpenDiameter
			height: ballOpenDiameter
			x: button.x + (ballClosedDiameter/2) - (ballOpenDiameter/2)
			y: button.y + (ballClosedDiameter/2) - (ballOpenDiameter/2)
		
		navbar.animate
			properties:
				height: navbarOpenHeight

		time: animationTime
	
	
# Close function
close = ->
	buttonActive = false
	
	button.animate
		properties:
			width: ballClosedDiameter
			height: ballClosedDiameter
			x: button.x - (ballClosedDiameter/2) + (ballOpenDiameter/2)
			y: button.y - (ballClosedDiameter/2) + (ballOpenDiameter/2)		
			
	navbar.animate
		properties:
			height: navbarClosedHeight
			
		time: animationTime
			




