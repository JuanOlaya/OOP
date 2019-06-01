/*
	***** PLAYER CLASS *****
	ECMAScript 6 Class Definition:
	http://es6-features.org/#ClassDefinition

	CIRCLE vs RECTANGLE COLLISION
	(Player vs Platform)
	Collision Detection based on Jeff Thompson's algorithm
	http://www.jeffreythompson.org/collision-detection/
	and modified by Juan Olaya as can be seen in the example:
	12 Sides Collision Detection
	https://www.openprocessing.org/sketch/627378
*/

class Player {

	constructor() {
		this.location = createVector(width/2, 0);
		this.velocity = createVector(0, 0);
		this.acceleration  = createVector(0, 0.2);
		this.colour = color('#198BC6');
		this.radius = 26;
		this.side=0;		  // (ES) Atributo que almacena el lado de la colisión detectada
		this.speedX=7;
		this.minSpeed=0;  // (ES) Atributo que almacena la mínima velocidad alcanzada por el player
	}

	// (ES) Método que muestra el objeto en la pantalla
	show() {
		noStroke();
		fill(this.colour);
		ellipse(this.location.x, this.location.y, this.radius * 2, this.radius * 2);
		textSize(20);

		// (ES) this.minSpeed -> Atributo que almacena la mínima velocidad alcanzada por el player
		if(this.velocity.y < this.minSpeed){
			this.minSpeed=this.velocity.y;
		}
	}

	applyVelocityGravity() {
		this.velocity.add(this.acceleration); //velocity.x = velocity.x + acceleration.x; //velocity.y = velocity.y + acceleration.y;
		this.location.add(this.velocity);     //location.x = location.x + velocity.x; //location.y = location.y + velocity.y;
	}

	// (ES) Este método hace rebotar la bola si toca los bordes de la pantalla
	// (EN) Bounce on the edges of the screen
	bounceEdges(){

		if (this.location.y > height - this.radius) {
			this.velocity.x = 0;
			this.velocity.y = 0;
			this.location.y = 0;
		}
		if (this.location.y < this.radius-100) {
			this.velocity.y = this.velocity.y * (-1);
			this.location.y = this.radius;
		}
	}

	collisionCircleRect(rx, ry, rw, rh) {

		// temporary variables to set edges for testing
		let testX = this.location.x;
		let testY = this.location.y;

			// which edge is closest?
		if (this.location.x < rx){        // Está a la izquierda?
				testX = rx;        // compare to left edge
				this.side=12;
		}
		else if (this.location.x > rx+rw) {  // Está a la derecha?
				testX = rx+rw;     // right edge
				this.side=6;
		}
		if (this.location.y < ry)  {      // Está arriba?
				testY = ry;        // top edge
				this.side=3;
		}
		else if (this.location.y > ry+rh) {    // Está abajo?
					testY = ry+rh;     // bottom edge
					this.side=9;
		}

		if(this.location.x<rx && this.location.y<ry){
			if(ry-this.location.y<rx-this.location.x){
				this.side=1;
				testX = rx;
			}else /*if(rx-cx<=ry-cy)*/{
				this.side=2;
				testY = ry;
			}
		}
		if(this.location.x>rx+rw && this.location.y<ry){
			if(this.location.y-ry<(rx+rw)-this.location.x){
					this.side=4;
					testY = ry;
				}else /*if(rx-cx<=cy-(ry+rh))*/{
					this.side=5;
					testX = rx+rw;
			}
		}
		if(this.location.x>rx+rw && this.location.y>ry+rh){
			if(this.location.y-(ry+rh)<this.location.x-(rx+rw) ){
				this.side=7;
				testX = rx+rw;
			}else /*if(rx-cx<=cy-(ry+rh))*/{
				this.side=8;
				testY = ry+rh;
			}
		}
		if(this.location.x<rx && this.location.y>ry+rh){
			if( this.location.y-(ry+rh)<rx-this.location.x){
				this.side=11;
				testX = rx;
			}else /*if(rx-cx<=ry-cy)*/{
				this.side=10;
				testY = ry+rh;
			}
		}

		// get distance from closest edges
		let distX = this.location.x - testX;
		let distY = this.location.y - testY;
		let distance = sqrt((distX * distX) + (distY * distY));

		// if the distance is less than the radius, collision!

		if (distance <= this.radius) {
			if( this.side == 1){
				this.velocity.x = this.velocity.y *-1 /* (-0.4)*/ ;
				this.location.x = rx - this.radius;
			}
			if( this.side == 2){
				this.velocity.x = this.velocity.y *-1 /* (-0.4)*/ ;
				this.location.x = rx - this.radius; //
			}
			if( this.side == 3){
				this.minSpeed=0;
				if(this.velocity.y>10){
					this.velocity.y=10;
				}
				this.velocity.y = this.velocity.y * (-1.05);
				this.location.y = ry - this.radius;
				this.velocity.x = 0;
			}
			if(this.side == 4){
				this.velocity.x = this.velocity.y *1 /* (0.4)*/ ;
				this.location.x = rx+rw + this.radius;
			}
			if(this.side == 5){
				this.velocity.x = this.velocity.y  *1 ;
				this.location.x = rx+rw + this.radius;
			}
			if(this.side == 6){
				this.velocity.x = this.velocity.x * (-1);
				this.location.x = rx+rw + this.radius;
			}
			if(this.side == 7){
				this.velocity.y = this.velocity.x * (-1);
				this.location.x = rx+rw + this.radius; //
			}
			if(this.side == 8){
				this.velocity.x = this.velocity.y * (-1);
				this.location.y = ry +rh +this.radius; //
			}
			if(this.side == 9 ){
				this.velocity.y = this.velocity.y * (-1);
				this.location.y = ry +rh +this.radius;
			}
			if(this.side == 10){
				this.velocity.x = this.velocity.y;
				this.location.y = ry +rh +this.radius;
			}
			if(this.side == 11){
				this.velocity.y =	this.velocity.x ;
				this.location.x = rx - this.radius;  //
			}
			if( this.side == 12){
				this.velocity.x = this.velocity.x * (-1);
				this.location.x = rx - this.radius;
			}
			return true;
		}
		return false;
	}

	moveLeft(){
    this.location.x = constrain(this.location.x-this.speedX, this.radius, widthGame-this.radius);
  }

  moveRight(){
    this.location.x = constrain(this.location.x+this.speedX, this.radius, widthGame-this.radius);
  }

	moveUp() {
		if(this.velocity.y<0){
			this.velocity.y=this.velocity.y-0.6;
			if(this.velocity.y<-9){
				this.velocity.y=-9;
			}
		}
	}
}
