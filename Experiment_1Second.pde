int num=4;
Work[] nn=new Work[4];
boolean RR=false;
Work[] work=new Work[num];
boolean work0=false;
boolean work1=false;
boolean work2=false;
boolean work3=false;

class Work
{
  PVector location;
  int r;
  char a;
  int rr;
  Work(char name, int x, int y, int runtime, int w)
  {
    location=new PVector(x, y);
    r=runtime;
    a=name;
    rr=w;
  }

  void display1()
  {
    fill(rr, 140, 110);
    rect(location.x, location.y, 65, 65);
    textSize(20); 
    fill(0);
    text(a, location.x, location.y+20);
    textSize(30);
    text(r, location.x+24, location.y+50);
  }  

  void display2()
  {
    fill(rr, 140, 110);
    rect(location.x, location.y+100, 65, 65);
    textSize(20); 
    fill(0);
    text(a, location.x, location.y+100+20);
    textSize(30);
    text(r, location.x+24, location.y+50+100);
  }
}

//only run one time
void setup() {
  size(800, 600);
  background(255, 204, 0);

  pushStyle();
  rect(700, 520, 65, 65);
  textSize(20);    
  fill(0);
  text("sort", 715, 557); 
  popStyle();

  pushStyle();
  rect(700, 410, 65, 65);
  textSize(20);    
  fill(0);
  text("RR", 720, 450); 
  popStyle();

  pushStyle();
  fill(50, 190, 0);
  rect(30, 250, 72, 72);
  textSize(20);    
  fill(0);
  text("CPU", 45, 287); 
  popStyle();

  for (int i=0; i<num; i++) {
    work[0]=new Work('A', 100, 50, 5, 0);  
    work[1]=new Work('B', 200, 50, 6, 145);   
    work[2]=new Work('C', 300, 50, 3, 210); 
    work[3]=new Work('D', 400, 50, 2, 255); 
    work[i].display1();
  }
  nn[0]=work[0];
  nn[1]=work[0];
  nn[2]=work[0];
  nn[3]=work[0];
  textSize(20); 
  text("Before", 30, 90);
  work0=true;
  //  sort(4);
}

void sort(int a) {
  if (RR) {
    for (int j=0; j<a-1; j++) {
      int tmp1=work[j].r;
      work[j].r=work[j+1].r;
      work[j+1].r=tmp1;

      char tmp2=work[j].a;
      work[j].a=work[j+1].a;
      work[j+1].a=tmp2;

      int tmp3=work[j].rr;
      work[j].rr=work[j+1].rr;
      work[j+1].rr=tmp3;
    }
  }
}
//run repeatedly
void draw() {
}

void mouseClicked() {
  //sort
  if (mouseX>700 && mouseX<765 && mouseY>520 && mouseY<585) {
    sort(num);
    for (int i=0; i<4; i++) {
      work[i].display2();
    }

    textSize(20);
    text("Sort", 35, 190);
  }

  //RR
  if (mouseX>700 && mouseX<765 && mouseY>410 && mouseY<475) {
    RR=true;
  }
}

void keyPressed() {
  if (RR) {
    pushStyle();
    fill(255, 204, 0);
    stroke(255, 204, 0);
    rect(100, 150, 66, 66);    
    popStyle();
    if ((key == 'A')||(key == 'a')) {
      if (work[0].r>0&& work0 && !work1 && !work2 && !work3) {
        work[0].r-=1;
        //work[0].display2();        
        work[0].location.x+=(30-work[0].location.x);
        work[0].location.y+=(250-work[0].location.y-100);
        work[0].display2();
        work0=true;
        work1=false;
        work2=false;
        work3=false;
      }
      if (work[1].r>0&& work1 && !work0 && !work2 && !work3) {
        work[1].r-=1;
        work[1].display2();
        work[1].location.x+=(30-work[1].location.x);
        work[1].location.y+=(250-work[1].location.y-100);
        work[1].display2();
        work0=false;
        work1=true;
        work2=false;
        work3=false;
      }
      if (work[2].r>0&& work2 && !work0 && !work1 && !work3) {
        work[2].r-=1;
        work[2].display2();
        work[2].location.x+=(30-work[2].location.x);
        work[2].location.y+=(250-work[2].location.y-100);
        work[2].display2();
        work0=false;
        work1=false;
        work2=true;
        work3=false;
      }     
      if (work[3].r>0 && work3 && !work0 && !work1 && !work2) {
        work[3].r-=1;
        work[3].display2();
        work[3].location.x+=(30-work[3].location.x);
        work[3].location.y+=(250-work[3].location.y-100);
        work[3].display2();
        work0=false;
        work1=false;
        work2=false;
        work3=true;
      }
      if (work[0].r==0) {
        switch (num) {
        case 4:
        textSize(20);
        fill(0);
          text("End", 480, 360+40);
          nn[0].r=work[0].r;
          fill(work[0].rr, 140, 110);
          rect(400, 360, 65, 65);
          textSize(20); 
          fill(0);
          text(work[0].a, 400, 360+20);
          textSize(30);
          text(nn[0].r, 400+24, 360+50);
          sort(num);
          num-=1;
          break;
        case 3:
          nn[1].r=work[0].r;
          fill(work[0].rr, 140, 110);
          rect(300, 360, 65, 65);
          textSize(20); 
          fill(0);
          text(work[0].a, 300, 360+20);
          textSize(30);
          text(nn[1].r, 300+24, 360+50);
          sort(num);
          num-=1;
          break;
        case 2:
          nn[2].r=work[0].r;
          fill(work[0].rr, 140, 110);
          rect(200, 360, 65, 65);
          textSize(20); 
          fill(0);
          text(work[0].a, 200, 360+20);
          textSize(30);
          text(nn[2].r, 200+24, 360+50);
          sort(num);
          num-=1;       
          break;
        case 1:
         nn[3].r=work[0].r;
          fill(work[0].rr, 140, 110);
          rect(100, 360, 65, 65);
          textSize(20); 
          fill(0);
          text(work[0].a, 100, 360+20);
          textSize(30);
          text(nn[3].r, 100+24, 360+50);
          sort(num);
          num-=1;     
          break;
        }
      }
    }
  }
}