import java.io.FileReader; //<>//
import java.io.IOException;
import java.io.FileNotFoundException;
import java.nio.charset.CharsetEncoder;
import java.nio.charset.Charset;

int screen=0;
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


String [] attoriV={};
String [] attoriF={};
String [] comuniV={};
String [] comuniF={};
String [] filmV={};
String [] filmF={};
String [] libriV={};
String [] libriF={};
int index_cenonce=0;
String [] V_cenonce={};
String [] F_cenonce={};
boolean risposta=false;



String [] parole={};
String [] definizione={};
int indice_sfida1=0;
int indice_sfida2=0;
int crono1=0;
int crono2=0;
int crono1_t0=0;
int crono2_t0=0;
boolean run_crono1=false;
boolean run_crono2=false;
boolean [] show1={};
boolean [] show2={};
boolean busy=false;

void setup() {
  fullScreen();
  //size(400, 400);
  background(255);

  attoriF=load_cenonce("C:\\Users\\trava\\Desktop\\l_eredit_\\attori.txt", attoriV, attoriF, false);
  attoriV=load_cenonce("C:\\Users\\trava\\Desktop\\l_eredit_\\attori.txt", attoriV, attoriF, true);
  comuniF=load_cenonce("C:\\Users\\trava\\Desktop\\l_eredit_\\comuni_italiani.txt", comuniV, comuniF, false);
  comuniV=load_cenonce("C:\\Users\\trava\\Desktop\\l_eredit_\\comuni_italiani.txt", comuniV, comuniF, true);
  filmV=load_cenonce("C:\\Users\\trava\\Desktop\\l_eredit_\\film.txt", filmV, filmF, false);
  filmF=load_cenonce("C:\\Users\\trava\\Desktop\\l_eredit_\\libri.txt", filmV, filmF, true);
  libriV=load_cenonce("C:\\Users\\trava\\Desktop\\l_eredit_\\film.txt", libriV, libriF, false);
  libriF=load_cenonce("C:\\Users\\trava\\Desktop\\l_eredit_\\libri.txt", libriV, libriF, true);

  definizione=load_sfida("C:\\Users\\trava\\Desktop\\l_eredit_\\sfida.txt", definizione, parole, true);
  parole=load_sfida("C:\\Users\\trava\\Desktop\\l_eredit_\\sfida.txt", definizione, parole, false);


  println(attoriV.length);
  println(attoriF.length);
  println(comuniV.length);
  println(comuniF.length);
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
      domanda4=concat(domanda4, subset(temp, 0, 1));
      ans14=concat(ans14, subset(temp, 1, 1));
      ans24=concat(ans24, subset(temp, 2, 1));
      ans34=concat(ans34, subset(temp, 3, 1));
      ans44=concat(ans44, subset(temp, 4, 1));
    }
  } while (line!=null);
}


void draw() {
  if (screen==0) {// sigla
    background(255);
    textAlign(CENTER, CENTER);
    stroke(0);
    fill(0);
    textSize(200);
    text("L'EREDITA'", width/2, height/2);
  } else if (screen==1) {// ce o non ce
    background(255);
    textAlign(CENTER, CENTER);
    stroke(0);
    fill(255);
    rect(width/10, height/8, (width/10)*8, height/2);
    fill(0);
    textSize(100);
    if (index_cenonce==0) {
      if (risposta) {
        text("nomi di attori:\n"+V_cenonce[index2], width/10, height/8, (width/10)*8, height/2);
      } else {
        text("nomi di attori:\n"+F_cenonce[index2], width/10, height/8, (width/10)*8, height/2);
      }
    } else if (index_cenonce==1) {
      if (risposta) {
        text("comuni italiani:\n"+V_cenonce[index2], width/10, height/8, (width/10)*8, height/2);
      } else {
        text("comuni italiani:\n"+F_cenonce[index2], width/10, height/8, (width/10)*8, height/2);
      }
    } else if (index_cenonce==2) {
      if (risposta) {
        text("titoli di film:\n"+V_cenonce[index2], width/10, height/8, (width/10)*8, height/2);
      } else {
        text("titoli di film:\n"+F_cenonce[index2], width/10, height/8, (width/10)*8, height/2);
      }
    } else if (index_cenonce==3) {
      if (risposta) {
        text("titoli di libri:\n"+V_cenonce[index2], width/10, height/8, (width/10)*8, height/2);
      } else {
        text("titoli di libri:\n"+F_cenonce[index2], width/10, height/8, (width/10)*8, height/2);
      }
    }
    if (ans1==0) {
      fill(255);
    } else if (ans1==1) {
      fill(255, 0, 0);
    } else if (ans1==2) {
      fill(0, 255, 0);
    } else if (ans1==3) {
      fill(255, 255, 0);
    }
    rect(width/10, (height/8)*5+70, (width/10)*4-10, (height/6));
    fill(0);
    textSize(50);
    text("c'è", width/10, (height/8)*5+70, (width/10)*4-10, (height/6));
    if (ans2==0) {
      fill(255);
    } else if (ans2==1) {
      fill(255, 0, 0);
    } else if (ans2==2) {
      fill(0, 255, 0);
    } else if (ans2==3) {
      fill(255, 255, 0);
    }
    rect(width/10+(width/10)*4+10, (height/8)*5+70, (width/10)*4-10, (height/6));
    fill(0);
    text("non c'è", width/10+(width/10)*4+10, (height/8)*5+70, (width/10)*4-10, (height/6));
  } else if (screen==2) {
    background(255);
    stroke(0);
    line(width/2, 0, width/2, height);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(80);

    if (((crono1-(millis()-crono1_t0))<0&run_crono1)|crono1==0) {
      run_crono1=false;
      crono1=0;
      if(millis()%1000<500){
        noFill();
        stroke(0);
        rect(width/4-120,height/4-50,240,100);
        fill(255,0,0);
        rect(width/4-120,height/4-50,240,100);
        fill(0);
        text("00.000", width/4, height/4);
      }else{
        noFill();
        stroke(0);
        rect(width/4-120,height/4-50,240,100);
        fill(0);
        rect(width/4-120,height/4-50,240,100);
        fill(255,0,0);
        text("00.000", width/4, height/4);
      }
      for(int i=0;i<show1.length;i++){
         show1[i]=true; 
      }
    } else {
      if (run_crono1) {
        text((crono1-(millis()-crono1_t0))/1000+"."+(crono1-(millis()-crono1_t0))%1000, width/4, height/4);
      } else {
        text(crono1/1000+"."+crono1%1000, width/4, height/4);
      }
    }
    fill(0);
    if (((crono2-(millis()-crono2_t0))<0&run_crono2)|crono2==0) {
      run_crono2=false;
      crono2=0;
      if(millis()%1000<500){
        noFill();
        stroke(0);
        rect(width*3/4-120,height/4-50,240,100);
        fill(255,0,0);
        rect(width*3/4-120,height/4-50,240,100);
        fill(0);
        text("00.000", width*3/4, height/4);
      }else{
        noFill();
        stroke(0);
        rect(width*3/4-120,height/4-50,240,100);
        fill(0);
        rect(width*3/4-120,height/4-50,240,100);
        fill(255,0,0);
        text("00.000", width*3/4, height/4);
      }
      for(int i=0;i<show2.length;i++){
         show2[i]=true; 
      }
    } else {
      if (run_crono2) {
        text((crono2-(millis()-crono2_t0))/1000+"."+(crono2-(millis()-crono2_t0))%1000, width*3/4, height/4);
      } else {
        text(crono2/1000+"."+crono2%1000, width*3/4, height/4);
      }
    }

    fill(0);
    textAlign(CENTER, CENTER);

    if (parole[indice_sfida1].length()<10) {
      textSize(135);
    } else if (parole[indice_sfida1].length()<18&parole[indice_sfida1].length()>10) {
      textSize(100);
    } else {
      textSize(60);
    }

    if (!busy&run_crono1&((millis()-crono1_t0)/100)%15==0) {
      busy=true;
      int lettere=0;
      for (int i=0; i<show1.length; i++) {
        if (show1[i]) {
          lettere++;
        }
      }
      if (lettere<show1.length-1) {
        do {
          lettere=(int)random(show1.length);
        } while (show1[lettere]);
        show1[lettere]=true;
      }
    }

    if (busy&run_crono1&((millis()-crono1_t0)/100)%15!=0) {
      busy=false;
    }

    String word="";

    for (int i=0; i<parole[indice_sfida1].length(); i++) {
      if (show1[i]) {
        word=word+parole[indice_sfida1].charAt(i);
      } else {
        word=word+"_";
      }
    }
    if (run_crono1|alltrue(show1)) {
      text(word, 20, height*5/8, width/2-40, height/3);
      textSize(50);
      text(definizione[indice_sfida1]+"  "+indice_sfida1, 20, height/3, width/2-40, height/3);
    }


    if (!busy&run_crono2&((millis()-crono2_t0)/100)%15==0) {
      busy=true;
      int lettere=0;
      for (int i=0; i<show2.length; i++) {
        if (show2[i]) {
          lettere++;
        }
      }
      if (lettere<show2.length-1) {
        do {
          lettere=(int)random(show2.length);
        } while (show2[lettere]);
        show2[lettere]=true;
      }
    }

    if (busy&run_crono2&((millis()-crono2_t0)/100)%15!=0) {
      busy=false;
    }

    word="";

    for (int i=0; i<parole[indice_sfida2].length(); i++) {
      if (show2[i]) {
        word=word+parole[indice_sfida2].charAt(i);
      } else {
        word=word+"_";
      }
    }
    if (word.length()<10) {
      textSize(135);
    } else if (word.length()<18&word.length()>10) {
      textSize(100);
    } else {
      textSize(60);
    }
    if (run_crono2|alltrue(show2)) {
      text(word, width/2+20, height*5/8, width/2-40, height/3);
      textSize(50);
      text(definizione[indice_sfida2]+"  "+indice_sfida2, width/2+20, height/3, width/2-40, height/3);
    }
  }
}

boolean alltrue(boolean [] ar) {
  for (int i=0; i<ar.length; i++) {
    if (!ar[i]) {
      return false;
    }
  }
  return true;
}


String[] load_cenonce(String file, String[] elencoV, String[] elencoF, boolean out) {
  File target =new File(file);
  BufferedReader reader=null;
  String line="";
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
      if (temp[1].equals("V")) {
        elencoV=concat_string(elencoV, temp[0]);
      } else if (temp[1].equals("F")) {
        elencoF=concat_string(elencoF, temp[0]);
      }
    }
  } while (line!=null);
  if (out) {
    return elencoV;
  } else {
    return elencoF;
  }
}

String[] load_sfida(String file, String[] def, String[] word, boolean out) {
  File target =new File(file);
  BufferedReader reader=null;
  String line="";
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
      word=concat_string(word, trim(temp[0]).toUpperCase());
      def=concat_string(def, trim(temp[1]));
    }
  } while (line!=null);
  if (out) {
    return def;
  } else {
    return word;
  }
}

String[] concat_string(String[] ar, String val) {
  String[] result=new String[ar.length+1];
  for (int i=0; i<ar.length; i++) {
    result[i]=ar[i];
  }
  result[ar.length]=val;
  return result;
}

void init() {
  if (screen==1) {
    ans1=0;
    ans2=0;
    index_cenonce=(int)random(4);
    switch (index_cenonce) {
    case 0:
      V_cenonce=attoriV;
      F_cenonce=attoriF;
      break;
    case 1:
      V_cenonce=comuniV;
      F_cenonce=comuniF;
      break;
    case 2:
      V_cenonce=filmV;
      F_cenonce=filmF;
      break;
    case 3:
      V_cenonce=libriV;
      F_cenonce=libriF;
      break;
    }
  } else if (screen==2) {
    run_crono1=false;
    run_crono2=false;
    crono1=45000;
    crono2=45000;
    indice_sfida1=(int)random(parole.length);
    indice_sfida2=(int)random(parole.length);
    show1=new boolean[parole[indice_sfida1].length()];
    show2=new boolean[parole[indice_sfida2].length()];
    show1[0]=true;
    show2[0]=true;
    busy=false;
  }
}

void drawn() {
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
    text(domanda4[index4], width/10, height/8, (width/10)*8, height*0.4);
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
    if (pos4[2]==0) {
      text(ans14[index4], width/10, (height/8)*6, (width/10)*4-10, (height/8));
    } else if (pos4[2]==1) {
      text(ans24[index4], width/10, (height/8)*6, (width/10)*4-10, (height/8));
    } else if (pos4[2]==2) {
      text(ans34[index4], width/10, (height/8)*6, (width/10)*4-10, (height/8));
    } else if (pos4[2]==3) {
      text(ans44[index4], width/10, (height/8)*6, (width/10)*4-10, (height/8));
    }

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
    if (pos4[3]==0) {
      text(ans14[index4], width/10+(width/10)*4+10, (height/8)*6, (width/10)*4-10, (height/8));
    } else if (pos4[3]==1) {
      text(ans24[index4], width/10+(width/10)*4+10, (height/8)*6, (width/10)*4-10, (height/8));
    } else if (pos4[3]==2) {
      text(ans34[index4], width/10+(width/10)*4+10, (height/8)*6, (width/10)*4-10, (height/8));
    } else if (pos4[3]==3) {
      text(ans44[index4], width/10+(width/10)*4+10, (height/8)*6, (width/10)*4-10, (height/8));
    }
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
    if (pos4[0]==0) {
      text(ans14[index4], width/10, (height/8)*5-20, (width/10)*4-10, (height/8));
    } else if (pos4[0]==1) {
      text(ans24[index4], width/10, (height/8)*5-20, (width/10)*4-10, (height/8));
    } else if (pos4[0]==2) {
      text(ans34[index4], width/10, (height/8)*5-20, (width/10)*4-10, (height/8));
    } else if (pos4[0]==3) {
      text(ans44[index4], width/10, (height/8)*5-20, (width/10)*4-10, (height/8));
    }
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
    if (pos4[1]==0) {
      text(ans14[index4], width/10+(width/10)*4+10, (height/8)*5-20, (width/10)*4-10, (height/8));
    } else if (pos4[1]==1) {
      text(ans24[index4], width/10+(width/10)*4+10, (height/8)*5-20, (width/10)*4-10, (height/8));
    } else if (pos4[1]==2) {
      text(ans34[index4], width/10+(width/10)*4+10, (height/8)*5-20, (width/10)*4-10, (height/8));
    } else if (pos4[1]==3) {
      text(ans44[index4], width/10+(width/10)*4+10, (height/8)*5-20, (width/10)*4-10, (height/8));
    }
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
    init();
  } else if (key=='d') {
    screen++;
    init();
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
    if (screen==1) {
      if (ans1==0&ans2==0) {
        ans1=3;
      } else if (ans1==3) {
        if (risposta) {
          ans1=2;
        } else {
          ans1=1;
          ans2=2;
        }
      } else if (ans1==0&ans2==3) {
        ans1=3;
        ans2=0;
      }
    } else if (screen==2) {
      if (!run_crono2&crono2>0) {
        if (run_crono1) {
          run_crono1=false;
          crono1=crono1-(millis()-crono1_t0);
          for (int i=0; i<show1.length; i++) {
            show1[i]=true;
          }
        } else {
          crono1_t0=millis();
          run_crono1=true;
          indice_sfida1=(int)random(parole.length);
          show1=new boolean[parole[indice_sfida1].length()];
          show1[0]=true;
        }
      }
    }
  } else if (key=='x') {
    if (screen==1) {
      if (ans2==0&ans1==0) {
        ans2=3;
      } else if (ans2==3) {
        if (!risposta) {
          ans2=2;
        } else {
          ans2=1;
          ans1=2;
        }
      } else if (ans2==0&ans1==3) {
        ans2=3;
        ans1=0;
      }
    }
    if (screen==2) {
      if (!run_crono1&crono1>0) {
        if (run_crono2) {
          run_crono2=false;
          crono2=crono2-(millis()-crono2_t0);
          for (int i=0; i<show2.length; i++) {
            show2[i]=true;
          }
        } else {
          crono2_t0=millis();
          run_crono2=true;
          indice_sfida2=(int)random(parole.length);
          show2=new boolean[parole[indice_sfida2].length()];
          show2[0]=true;
        }
      }
    }
  } else if (key=='c') {
    if (screen==1) {
      if (ans1==1|ans1==2|ans2==1|ans2==2) {
        if ((int)random(1000)<500) {
          risposta=true;
          index2=(int)random(V_cenonce.length);
        } else {
          risposta=false;
          index2=(int)random(F_cenonce.length);
        }
      }
      println(risposta+" "+index2+" "+ans1+" "+ans2);
      ans1=0;
      ans2=0;
    }
  } else if (key=='v') {
    if (screen==1) {
      if (pos4[3]==0) {
        ans4=2;
      } else {
        ans4=1;
      }
    }
  }
}
