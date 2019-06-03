/*
	***** PLATFORMER (GAME MECHANIC) *****
	#Procedural #Platformer #CollisionDetection #OOP
	Plataforms generated procedurally
  by Juan Olaya
  https://juanolaya.github.io/
*/

var platforms = [];
var player;
var widthGame;

function setup() {
  createCanvas(1200, 550);

	player = new Player();

	let countDistanceX = 0;
	for (let i=0;i<14;i++) {
    let platformTemp = new Platform(countDistanceX);
    platforms.push(platformTemp);

    countDistanceX = countDistanceX + platformTemp.rw + 130; // 130 = gap between platforms
  }
	widthGame = countDistanceX-130;
}

function draw() {
  background('#F4EDDD');

	translate(-player.location.x + width / 2, 0);

	player.show();
	player.applyVelocityGravity();
	player.bounceEdges()
	playerMovementInput();

	for(let i=0;i<platforms.length;i++){
		platforms[i].show();
		player.collisionCircleRect(platforms[i].rx, platforms[i].ry, platforms[i].rw, platforms[i].rh);
	}
	edgeLines();
	physicsInfo();
}

function keyPressed() {
  if (keyIsDown(32)){
    print("entra space");
    jump= true;
    solto=false;
  }
}

function keyReleased() {
  if (keyIsDown(32)) {
    jump=false;
    solto=true;
  }
}

function playerMovementInput(){
	if (keyIsDown(LEFT_ARROW))  {
    player.moveLeft();
  }
  if (keyIsDown(RIGHT_ARROW)) {
    player.moveRight();
  }
	if (keyIsDown(UP_ARROW)) {
    player.moveUp();
  }
}

function edgeLines(){
	stroke('#E85243');
	strokeWeight(80);
	line(-39,0,-39,height);
	line(widthGame+39,0,widthGame+39,height);
	noStroke();
}

function physicsInfo(){
	textSize(16);
	fill('#EE8176');
	text("Velocity.X:   "+Math.round(player.velocity.x), player.location.x-width/2+10,16);
	text("Velocity.Y:   "+Math.round(player.velocity.y),player.location.x-width/2+10,32);
	text("Acceleration.X:   "+player.acceleration.x,player.location.x-width/2+10,48);
	text("Acceleration.Y:   "+player.acceleration.y,player.location.x-width/2+10,64);
	text("Minimum speed going down:   "+Math.round(player.minSpeed*10)/10,player.location.x-width/2+10,80);
}
