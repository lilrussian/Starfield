Particle[] firework;
double posX;
double posY;
int part = 1;
double thatX = 0;
void setup()
{
  background(0,0,0,120);
  size(600, 600);
 
  firework = new Particle[1000];
  for(int i = 0; i < firework.length; i++)
  {
    firework[i] = new OddballParticle();
    
  }
   firework[1] = new OddballParticle1();
}
void draw()
{
  for(int i = 0; i < part; i++)
  {
    firework[i].move();
    firework[i].show();
    if(firework[i].myY < 150 && part != 100)
    {
      for(int j = 0; j < firework.length; j++)
      {
       
        thatX = firework[0].myX;
        firework[j] = new Particle();
        part = 100;

      }
    }
  }

}
void mousePressed()
{
  redraw();
  background(0);
  part = 1;
 
  for(int i = 0; i < firework.length; i++)
  {
    firework[i] = new OddballParticle();

  }

}
class Particle
{
  double myX, myY, myAngle, mySpeed;
  int myColor;
  Particle()
  {
   myX = posX;
  myY = posY;
  mySpeed = Math.random()*5;
  myAngle = Math.random()*2*Math.PI;
  myColor = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
  }
  void move()
  {

  myX = myX + Math.cos(myAngle)*mySpeed;
  myY = myY + Math.sin(myAngle)*mySpeed;

  }

  void show()
  {
    
    fill(myColor);
  stroke(255);
  ellipse((float)myX,(float)myY,15,15);

  }
}
class OddballParticle extends Particle //inherits from Particle
{
  int boundary;
  OddballParticle()
  {
    myX = (int)(Math.random()*450)+100;
    myY = 600;
    mySpeed = 5;
    boundary = 0;
    //angle = Math.random()*8+Math.PI;
   
  }

  void move()
  {
    myX += (int)(Math.random()*10) - 5;
    myY -= Math.random()*mySpeed;
    posX = myX;
    posY = myY;

    if(myY < boundary)
    {
      mySpeed = 0;
    }
  }

  void show()
  {
    noStroke();
    fill(255,255,255,120);
   
    ellipse((float)myX, (float)myY, 10.0, 10.0);
  }

}

class OddballParticle1 extends Particle
{
  
  OddballParticle1()
  {
    myX = posX;
    myY = posY;
  }

  public void show()
  {
     fill(37, 165, 33);
    ellipse((float)myX, (float)myY-20, 78, 83);
    ellipse((float)myX, (float)myY, 88, 88);
    fill(216, 226, 154);
    ellipse((float)myX, (float)myY, 80, 80);
    ellipse((float)myX, (float)myY-20, 70, 75);
    fill(119, 84, 19);
    ellipse((float)myX, (float)myY, 40, 40);
  }
}


