/*
	***** PLATFORM CLASS *****
	ECMAScript 6 Class Definition:
	http://es6-features.org/#ClassDefinition
*/

class Platform {
  constructor(posX) {
    this.rw = random(100, 500);
    this.rh = random(30, 270);
		this.rx = posX;
    this.ry = height - this.rh;   //height - heightPlatform
    this.colour = color('#E85243'); // red
  }

	show (){
		fill(this.colour);
    noStroke();
    rect(this.rx, this.ry , this.rw, this.rh);
	}
}
