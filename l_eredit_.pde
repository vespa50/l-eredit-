import java.io.FileReader; //<>//
import java.io.IOException;
import java.io.FileNotFoundException;

int screen=1;
long time0=0;
long tempo=45000;
boolean start=false;
boolean end=false;
int ans1=0;
int ans2=0;
int ans3=0;
int ans4=0;
String line=null;
String obbiettivo_add2 = "C:\\Users\\trava\\Desktop\\l_eredit_\\domande2.txt";
String obbiettivo_add4 = "C:\\Users\\trava\\Desktop\\l_eredit_\\domande4.txt";
BufferedReader reader;
File target;

String [] domanda2={};
String [] ans12={};
String [] ans22={};
int index2=0;
int []pos2={0, 1};

String [] domanda4={};
String [] ans14={};
String [] ans24={};
String [] ans34={};
String [] ans44={};
int index4=0;
int []pos4={0, 1, 2, 3};


void setup() {
  //fullScreen();
  size(400, 400);
  background(255);

  target =new File(obbiettivo_add2);
  try {
    reader=new BufferedReader(new FileReader(target));
  }
  catch(FileNotFoundException e) {
    println("file not found");
    exit();
  }

  do {
    try {
      line=reader.readLine();
    }
    catch(IOException e) {
      println("ioexception file");
      exit();
    }
    if (line!=null) {
      String [] temp=split(line, '|');
      domanda2=concat(domanda2, subset(temp, 0, 1));
      ans12=concat(ans12, subset(temp, 1, 1));
      ans22=concat(ans22, subset(temp, 2, 1));
    }
  } while (line!=null);


  target =new File(obbiettivo_add4);
  try {
    reader=new BufferedReader(new FileReader(target));
  }
  catch(FileNotFoundException e) {
    println("file not found");
    exit();
  }

  do {
    try {
      line=reader.readLine();
    }
    catch(IOException e) {
      println("ioexception file");
      exit();
    }
    if (line!=null) {
      String [] temp=split(line, '|');
      domanda4=concat(domanda2, subset(temp, 0, 1));
      ans14=concat(ans12, subset(temp, 1, 1));
      ans24=concat(ans22, subset(temp, 2, 1));
      ans34=concat(ans12, subset(temp, 3, 1));
      ans44=concat(ans22, subset(temp, 4, 1));
    }
  } while (line!=null);
}

void draw() {
  if (screen==0) {
    background(255);
    textAlign(CENTER, CENTER);
    stroke(0);
    fill(255);
    rect(width/10, height/8, (width/10)*8, height/2);
    fill(0);
    textSize(100);
    text(domanda2[index2], width/10, height/8, (width/10)*8, height/2);
    if (ans1==0) {
      fill(255);
    } else if (ans1==1) {
      fill(255, 0, 0);
    } else if (ans1==2) {
      fill(0, 255, 0);
    }
    rect(width/10, (height/8)*5+70, (width/10)*4-10, (height/6));
    fill(0);
    textSize(50);
    if (pos2[0]==0) {
      text(ans12[index2], width/10, (height/8)*5+70, (width/10)*4-10, (height/6));
    } else if (pos2[0]==1) {
      text(ans22[index2], width/10, (height/8)*5+70, (width/10)*4-10, (height/6));
    }
    if (ans2==0) {
      fill(255);
    } else if (ans2==1) {
      fill(255, 0, 0);
    } else if (ans2==2) {
      fill(0, 255, 0);
    }
    rect(width/10+(width/10)*4+10, (height/8)*5+70, (width/10)*4-10, (height/6));
    fill(0);
    if (pos2[1]==0) {
      text(ans12[index2], width/10+(width/10)*4+10, (height/8)*5+70, (width/10)*4-10, (height/6));
    } else if (pos2[1]==1) {
      text(ans22[index2], width/10+(width/10)*4+10, (height/8)*5+70, (width/10)*4-10, (height/6));
    }
    
    //background(255,0,0);
  } else if (screen==1) {
    background(255);
    textAlign(CENTER, CENTER);
    stroke(0);
    fill(255);
    rect(width/10, height/8, (width/10)*8, height*0.4);
    fill(0);
    textSize(100);
    text("domanda", width/10, height/8, (width/10)*8, height*0.4);
    if (ans3==0) {
      fill(255);
    } else if (ans3==1) {
      fill(255, 0, 0);
    } else if (ans3==2) {
      fill(0, 255, 0);
    }
    rect(width/10, (height/8)*6, (width/10)*4-10, (height/8));
    fill(0);
    textSize(50);
    text("risposta3", width/10, (height/8)*6, (width/10)*4-10, (height/8));
    if (ans4==0) {
      fill(255);
    } else if (ans4==1) {
      fill(255, 0, 0);
    } else if (ans4==2) {
      fill(0, 255, 0);
    }
    rect(width/10+(width/10)*4+10, (height/8)*6, (width/10)*4-10, (height/8));
    fill(0);
    textSize(50);
    text("risposta4", width/10+(width/10)*4+10, (height/8)*6, (width/10)*4-10, (height/8));
    if (ans1==0) {
      fill(255);
    } else if (ans1==1) {
      fill(255, 0, 0);
    } else if (ans1==2) {
      fill(0, 255, 0);
    }
    rect(width/10, (height/8)*5-20, (width/10)*4-10, (height/8));
    fill(0);
    textSize(50);
    text("risposta1", width/10, (height/8)*5-20, (width/10)*4-10, (height/8));
    if (ans2==0) {
      fill(255);
    } else if (ans2==1) {
      fill(255, 0, 0);
    } else if (ans2==2) {
      fill(0, 255, 0);
    }
    rect(width/10+(width/10)*4+10, (height/8)*5-20, (width/10)*4-10, (height/8));
    fill(0);
    textSize(50);
    text("risposta2", width/10+(width/10)*4+10, (height/8)*5-20, (width/10)*4-10, (height/8));
    //background(0,255,0);
  } else if (screen==2) {
    if (end) {
      if (millis()%1000<500) {
        background(255);
      } else {
        background(255, 0, 0);
      }
    } else {
      background(255);
    }
    textAlign(CENTER, CENTER);
    fill(0);
    textSize(250);
    text(tempo/1000+"."+tempo%1000, width/2, height/2);
    if (start) {
      tempo=45000-(millis()-time0);
      if (tempo<=0) {
        start=false;
        tempo=0;
        end=true;
      }
    }
  }
  println(screen);
}

void shuffle(int [] in) {
  int a;
  int b;
  int temp;
  for (int i=0; i<10; i++) {
    a=(int)random(in.length);
    b=(int)random(in.length);
    temp=in[a];
    in[a]=in[b];
    in[b]=temp;
  }
}


void keyPressed() {

  if (key=='s') {
    screen--;

    if (screen<0) {
      screen=2;
    }
    if (screen==0) {
      ans1=0;
      ans2=0;
    } else if (screen==1) {
      ans1=0;
      ans2=0;
      ans3=0;
      ans4=0;
      index2=(int)random(domanda2.length);
      shuffle(pos2);
    } else if (screen==2) {
      start=false;
      end=false;
      tempo=45000;
    }
  } else if (key=='d') {
    screen++;
    start=false;
    end=false;
    tempo=45000;
    ans1=0;
    ans2=0;
    ans3=0;
    ans4=0;
    if (screen>2) {
      screen=0;
    }
  } else if (key=='a') {
    if (start) {
      start=false;
    } else {
      start=true;
      end=false;
      time0=millis();
    }
  } else if (key=='z') {
    ans1++;
  } else if (key=='x') {
    ans2++;
  } else if (key=='c') {
    ans3++;
  } else if (key=='v') {
    ans4++;
  }
}
