import java.io.FileReader;
import java.io.IOException;
import java.io.FileNotFoundException;
import java.nio.charset.CharsetEncoder;
import java.nio.charset.Charset;
import processing.sound.*;

SoundFile sigla;
SoundFile tempo;
SoundFile doppio;
SoundFile aumento;
SoundFile esatto;
SoundFile sbagliato;
SoundFile libri;
SoundFile film;
SoundFile comuni;
SoundFile attori;
SoundFile ghi_start;
SoundFile ghi_ok;
SoundFile ghi_nok;
SoundFile ghi_minuto;
SoundFile ghi_vittoria;
SoundFile triello;

PImage back;


int screen=0;
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

int time0=0;

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

String[] chicomecosa_domande={};
String[] chicomecosa_rispV={};
String[] chicomecosa_rispF={};
int chicomecosa_index=0;
int [] chicomecosa_pos={0, 1};

String [] data_1971={};
String [] data_1987={};
String [] data_1995={};
String [] data_2000={};
int data_index=0;
int data_anno=0;
int []data_pos={0, 1, 2, 3};

int triello_index=0;
String[] triello_domanda={};
String[] triello_rispostaV={};
String[] triello_risposta1={};
String[] triello_risposta2={};
String[] triello_risposta3={};
int []triello_pos={0, 1, 2, 3};
boolean[] triello_used={false, false, false, false, false, false, false};

void setup() {
  fullScreen();
  //size(400, 400);
  back=loadImage("C:\\Users\\trava\\Desktop\\l_eredit_\\back.jpg");
  image(back, 0, 0, width, height);

  sigla = new SoundFile(this, "Sigla_iniziale.mp3");
  tempo= new SoundFile(this, "Tempo_scaduto.mp3");
  doppio= new SoundFile(this, "Doppio_errore.mp3");
  aumento= new SoundFile(this, "Aumento_denaro.mp3");
  esatto= new SoundFile(this, "Risposta_esatta.mp3");
  sbagliato= new SoundFile(this, "Risposta_sbagliata.mp3");
  libri= new SoundFile(this, "Titoli libri.mp3");
  film= new SoundFile(this, "Titoli film.mp3");
  comuni= new SoundFile(this, "Comuni italiani.mp3");
  attori= new SoundFile(this, "Nome attori.mp3");
  //ghi_start= new SoundFile(this, "GHI- Inizio.m4a");
  ghi_ok= new SoundFile(this, "GHI- Parola giusta.mp3");
  ghi_nok= new SoundFile(this, "GHI- Parola sbagliata.mp3");
  ghi_minuto= new SoundFile(this, "GHI- Minuto di tempo.mp3");
  ghi_vittoria= new SoundFile(this, "GHI- Vittoria.mp3");
  triello= new SoundFile(this, "Triello.mp3");

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


  chicomecosa_domande=load_chicomecosa("C:\\Users\\trava\\Desktop\\l_eredit_\\chi_come_cosa.txt", chicomecosa_domande, chicomecosa_rispV, chicomecosa_rispF, 0);
  chicomecosa_rispV=load_chicomecosa("C:\\Users\\trava\\Desktop\\l_eredit_\\chi_come_cosa.txt", chicomecosa_domande, chicomecosa_rispV, chicomecosa_rispF, 1);
  chicomecosa_rispF=load_chicomecosa("C:\\Users\\trava\\Desktop\\l_eredit_\\chi_come_cosa.txt", chicomecosa_domande, chicomecosa_rispV, chicomecosa_rispF, 2);

  data_1971=load_data("C:\\Users\\trava\\Desktop\\l_eredit_\\1971.txt", data_1971);
  data_1987=load_data("C:\\Users\\trava\\Desktop\\l_eredit_\\1987.txt", data_1987);
  data_1995=load_data("C:\\Users\\trava\\Desktop\\l_eredit_\\1995.txt", data_1995);
  data_2000=load_data("C:\\Users\\trava\\Desktop\\l_eredit_\\2000.txt", data_2000);

  triello_domanda=concat_string(triello_domanda, "Quale è stato il primo trapianto di questo tipo eseguito il 23 dicembre 1954 all'ospedale di Peter Bent Brigham di Boston, negli Stati Uniti, da un team di chirurghi guidato da Joseph Murray?");
  triello_domanda=concat_string(triello_domanda, "Quale delle seguenti aziende automobilistiche ha prodotto più veicoli nel 2023 (10.5mln)?");
  triello_domanda=concat_string(triello_domanda, "Da quale videogioco è tratta la frase \"Ah shit, here we go again\", utilizzata poi successivamente per la creazione di innumerevoli meme?");
  triello_domanda=concat_string(triello_domanda, "Nel opera letteraria \"I Promessi Sposi\", scritta da Alessandro Manzonie pubblicata per la prima volta nel 1827, di quanti capitoli era composta la prima edizione?");
  triello_domanda=concat_string(triello_domanda, "All' interno delle monarchie europee, quale fu il nome più utilizzato dai sovrani?");
  triello_domanda=concat_string(triello_domanda, "Quale dei seguenti non è il nome dato ad un uragano che ha colpito gli Stati Uniti d'America?");
  triello_domanda=concat_string(triello_domanda, "Quale delle seguenti nazioni ha ottenuto più medagie olimpiche nella storia dei giochi moderni con un totale di 2543?");

  triello_rispostaV=concat_string(triello_rispostaV, "trapianto di rene");
  triello_rispostaV=concat_string(triello_rispostaV, "Toyota");
  triello_rispostaV=concat_string(triello_rispostaV, "GTA: San Andreas");
  triello_rispostaV=concat_string(triello_rispostaV, "38");
  triello_rispostaV=concat_string(triello_rispostaV, "Luigi");
  triello_rispostaV=concat_string(triello_rispostaV, "Uragano Karen");
  triello_rispostaV=concat_string(triello_rispostaV, "Stati Uniti d'America");

  triello_risposta1=concat_string(triello_risposta1, "trapianto di cuore");
  triello_risposta1=concat_string(triello_risposta1, "Volkswagen Group");
  triello_risposta1=concat_string(triello_risposta1, "Fortnight");
  triello_risposta1=concat_string(triello_risposta1, "36");
  triello_risposta1=concat_string(triello_risposta1, "Carlo");
  triello_risposta1=concat_string(triello_risposta1, "Uragano Carol");
  triello_risposta1=concat_string(triello_risposta1, "Germania");

  triello_risposta2=concat_string(triello_risposta2, "trapianto di polmoni");
  triello_risposta2=concat_string(triello_risposta2, "Stellantis");
  triello_risposta2=concat_string(triello_risposta2, "Call of Duty");
  triello_risposta2=concat_string(triello_risposta2, "35");
  triello_risposta2=concat_string(triello_risposta2, "Enrico");
  triello_risposta2=concat_string(triello_risposta2, "Uragano Ike");
  triello_risposta2=concat_string(triello_risposta2, "Paesi Bassi");

  triello_risposta3=concat_string(triello_risposta3, "trapianto di fegato");
  triello_risposta3=concat_string(triello_risposta3, "General Motors");
  triello_risposta3=concat_string(triello_risposta3, "Half life");
  triello_risposta3=concat_string(triello_risposta3, "31");
  triello_risposta3=concat_string(triello_risposta3, "Giorgio");
  triello_risposta3=concat_string(triello_risposta3, "Uragano Irma");
  triello_risposta3=concat_string(triello_risposta3, "Italia");

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
    image(back, 0, 0, width, height);
    textAlign(CENTER, CENTER);
    fill(255);
    textSize(200);
    text("L'EREDITA'", width/2, height/2);
    if (!sigla.isPlaying()) {
      sigla.loop();
    }
  } else if (screen==1&millis()-time0<12000) {// ce o non ce
    image(back, 0, 0, width, height);
    textAlign(CENTER, CENTER);
    fill(255);
    textSize(200);
    if (index_cenonce==0) {
      if (!attori.isPlaying()) {
        attori.play();
      }
      text("CE' O NON CE'\n NOMI DI ATTORI", width/2, height/2);
    } else if (index_cenonce==1) {
      if (!comuni.isPlaying()) {
        comuni.play();
      }
      text("CE' O NON CE'\n COMUNI ITALIANI", width/2, height/2);
    } else if (index_cenonce==2) {
      if (!film.isPlaying()) {
        film.play();
      }
      text("CE' O NON CE'\n TITOLI DI FILM", width/2, height/2);
    } else if (index_cenonce==3) {
      if (!libri.isPlaying()) {
        libri.play();
      }
      text("CE' O NON CE'\n TITOLI DI LIBRI", width/2, height/2);
    }
  } else if (screen==1) {// ce o non ce
    image(back, 0, 0, width, height);
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
  } else if (screen==2|screen==4|screen==6|screen==8) {
    image(back, 0, 0, width, height);
    stroke(255);
    line(width/2, height/10+70, width/2, height);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(80);
    text("SFIDA", width/2, height/10);

    if (((crono1-(millis()-crono1_t0))<0&run_crono1)|crono1==0) {
      run_crono1=false;
      crono1=0;
      if (!tempo.isPlaying()) {
        tempo.play();
      }
      if (millis()%1000<500) {
        noFill();
        stroke(0);
        rect(width/4-120, height/4-50, 240, 100);
        fill(255, 0, 0);
        rect(width/4-120, height/4-50, 240, 100);
        fill(255);
        text("00.000", width/4, height/4);
      } else {
        noFill();
        stroke(0);
        rect(width/4-120, height/4-50, 240, 100);
        fill(255);
        rect(width/4-120, height/4-50, 240, 100);
        fill(255, 0, 0);
        text("00.000", width/4, height/4);
      }
      for (int i=0; i<show1.length; i++) {
        show1[i]=true;
      }
    } else {
      fill(255);
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
      if (!tempo.isPlaying()) {
        tempo.play();
      }
      if (millis()%1000<500) {
        noFill();
        stroke(0);
        rect(width*3/4-120, height/4-50, 240, 100);
        fill(255, 0, 0);
        rect(width*3/4-120, height/4-50, 240, 100);
        fill(255);
        text("00.000", width*3/4, height/4);
      } else {
        noFill();
        stroke(0);
        rect(width*3/4-120, height/4-50, 240, 100);
        fill(255);
        rect(width*3/4-120, height/4-50, 240, 100);
        fill(255, 0, 0);
        text("00.000", width*3/4, height/4);
      }
      for (int i=0; i<show2.length; i++) {
        show2[i]=true;
      }
    } else {
      fill(255);
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

    if (!busy&run_crono1&((millis()-crono1_t0)/100)%25==0) {
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

    if (busy&run_crono1&((millis()-crono1_t0)/100)%25!=0) {
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
    fill(255);
    if (run_crono1|alltrue(show1)) {
      text(word, 20, height*5/8, width/2-40, height/3);
      textSize(50);
      text(definizione[indice_sfida1]+"  "+indice_sfida1, 20, height/3, width/2-40, height/3);
    } else {
      textSize(50);
      text(indice_sfida1+"", 20, height/3, width/2-40, height/3);
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
    fill(255);
    if (run_crono2|alltrue(show2)) {
      text(word, width/2+20, height*5/8, width/2-40, height/3);
      textSize(50);
      text(definizione[indice_sfida2]+"  "+indice_sfida2, width/2+20, height/3, width/2-40, height/3);
    } else {
      textSize(50);
      text(indice_sfida2+"", width/2+20, height/3, width/2-40, height/3);
    }
  } else if (screen==3&millis()-time0<5000) {// chicomecosa
    image(back, 0, 0, width, height);
    textAlign(CENTER, CENTER);
    fill(255);
    textSize(200);
    text("CHI,COME,COSA", width/2, height/2);
  } else if (screen==3) {
    image(back, 0, 0, width, height);
    textAlign(CENTER, CENTER);
    stroke(0);
    fill(255);
    rect(width/10, height/8, (width/10)*8, height/2);
    fill(0);
    textSize(100);
    text(chicomecosa_domande[chicomecosa_index], width/10, height/8, (width/10)*8, height/2);
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
    if (chicomecosa_pos[0]==0) {
      text(chicomecosa_rispV[chicomecosa_index], width/10, (height/8)*5+70, (width/10)*4-10, (height/6));
    } else if (chicomecosa_pos[0]==1) {
      text(chicomecosa_rispF[chicomecosa_index], width/10, (height/8)*5+70, (width/10)*4-10, (height/6));
    }
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
    if (chicomecosa_pos[1]==0) {
      text(chicomecosa_rispV[chicomecosa_index], width/10+(width/10)*4+10, (height/8)*5+70, (width/10)*4-10, (height/6));
    } else if (chicomecosa_pos[1]==1) {
      text(chicomecosa_rispF[chicomecosa_index], width/10+(width/10)*4+10, (height/8)*5+70, (width/10)*4-10, (height/6));
    }
  } else if (screen==5&millis()-time0<5000) {// DATE
    image(back, 0, 0, width, height);
    textAlign(CENTER, CENTER);
    fill(255);
    textSize(200);
    text("DATE", width/2, height/2);
  } else if (screen==5) {
    image(back, 0, 0, width, height);
    textAlign(CENTER, CENTER);
    stroke(0);
    fill(255);
    rect(width/10, height/8, (width/10)*8, height*0.4);
    fill(0);
    textSize(30);
    if (data_anno==0) {
      text(data_1971[data_index], width/10, height/8, (width/10)*8, height*0.4);
    } else if (data_anno==1) {
      text(data_1987[data_index], width/10, height/8, (width/10)*8, height*0.4);
    } else if (data_anno==2) {
      text(data_1995[data_index], width/10, height/8, (width/10)*8, height*0.4);
    } else if (data_anno==3) {
      text(data_2000[data_index], width/10, height/8, (width/10)*8, height*0.4);
    }

    if (ans3==0) {
      fill(255);
    } else if (ans3==1) {
      fill(255, 0, 0);
    } else if (ans3==2) {
      fill(0, 255, 0);
    } else if (ans3==3) {
      fill(255, 255, 0);
    }
    rect(width/10, (height/8)*6, (width/10)*4-10, (height/8));
    fill(0);
    textSize(70);
    text("1995", width/10, (height/8)*6, (width/10)*4-10, (height/8));

    if (ans4==0) {
      fill(255);
    } else if (ans4==1) {
      fill(255, 0, 0);
    } else if (ans4==2) {
      fill(0, 255, 0);
    } else if (ans4==3) {
      fill(255, 255, 0);
    }
    rect(width/10+(width/10)*4+10, (height/8)*6, (width/10)*4-10, (height/8));
    fill(0);
    textSize(70);
    text("2000", width/10+(width/10)*4+10, (height/8)*6, (width/10)*4-10, (height/8));

    if (ans1==0) {
      fill(255);
    } else if (ans1==1) {
      fill(255, 0, 0);
    } else if (ans1==2) {
      fill(0, 255, 0);
    } else if (ans1==3) {
      fill(255, 255, 0);
    }
    rect(width/10, (height/8)*5-20, (width/10)*4-10, (height/8));
    fill(0);
    textSize(70);
    text("1971", width/10, (height/8)*5-20, (width/10)*4-10, (height/8));

    if (ans2==0) {
      fill(255);
    } else if (ans2==1) {
      fill(255, 0, 0);
    } else if (ans2==2) {
      fill(0, 255, 0);
    } else if (ans2==3) {
      fill(255, 255, 0);
    }
    rect(width/10+(width/10)*4+10, (height/8)*5-20, (width/10)*4-10, (height/8));
    fill(0);
    textSize(70);
    text("1987", width/10+(width/10)*4+10, (height/8)*5-20, (width/10)*4-10, (height/8));
  } else if (screen==7) {
    image(back, 0, 0, width, height);
    textAlign(CENTER, CENTER);
    stroke(0);
    fill(255);
    textSize(200);
    text("PAROLONI", width/2, height/2);
  } else if (screen==9&millis()-time0<5000) {// ce o non ce
    image(back, 0, 0, width, height);
    textAlign(CENTER, CENTER);
    fill(255);
    textSize(200);
    text("TRIELLO", width/2, height/2);
  } else if (screen==9) {
    if (triello_index==0) {
      image(back, 0, 0, width, height);
      if (triello_used[0]) {
        fill(255, 255, 0);
      } else {
        fill(255);
      }
      rect(width/4-width/10, height/6-height/12, width/5, height/6);
      if (triello_used[1]) {
        fill(255, 255, 0);
      } else {
        fill(255);
      }
      rect(width*3/4-width/10, height/6-height/12, width/5, height/6);
      if (triello_used[2]) {
        fill(255, 255, 0);
      } else {
        fill(255);
      }
      rect(width/4-width/10, height*5/6-height/12, width/5, height/6);
      if (triello_used[3]) {
        fill(255, 255, 0);
      } else {
        fill(255);
      }
      rect(width*3/4-width/10, height*5/6-height/12, width/5, height/6);
      if (triello_used[4]) {
        fill(255, 255, 0);
      } else {
        fill(255);
      }
      rect(width/6-width/10, height*3/6-height/12, width/5, height/6);
      if (triello_used[5]) {
        fill(255, 255, 0);
      } else {
        fill(255);
      }
      rect(width*3/6-width/10, height*3/6-height/12, width/5, height/6);
      if (triello_used[6]) {
        fill(255, 255, 0);
      } else {
        fill(255);
      }
      rect(width*5/6-width/10, height*3/6-height/12, width/5, height/6);
      fill(0);
      textAlign(CENTER, CENTER);
      textSize(60);
      text("medicina", width/4-width/10, height/6-height/12, width/5, height/6);
      text("industria", width*3/4-width/10, height/6-height/12, width/5, height/6);
      text("meme", width/4-width/10, height*5/6-height/12, width/5, height/6);
      text("letteratura", width*3/4-width/10, height*5/6-height/12, width/5, height/6);
      text("storia", width/6-width/10, height*3/6-height/12, width/5, height/6);
      text("meteorologia", width*3/6-width/10, height*3/6-height/12, width/5, height/6);
      text("sport", width*5/6-width/10, height*3/6-height/12, width/5, height/6);
    } else if (triello_index>=1) {
      image(back, 0, 0, width, height);
      textAlign(CENTER, CENTER);
      stroke(0);
      fill(255);
      rect(width/10, height/8, (width/10)*8, height*0.4);
      fill(0);
      textSize(60);

      text(triello_domanda[triello_index-1], width/10, height/8, (width/10)*8, height*0.4);
      if (ans3==0) {
        fill(255);
      } else if (ans3==1) {
        fill(255, 0, 0);
      } else if (ans3==2) {
        fill(0, 255, 0);
      } else if (ans3==3) {
        fill(255, 255, 0);
      }
      rect(width/10, (height/8)*6, (width/10)*4-10, (height/8));
      fill(0);
      textSize(70);
      if (triello_pos[2]==0) {
        text(triello_rispostaV[triello_index-1], width/10, (height/8)*6, (width/10)*4-10, (height/8));
      } else if (triello_pos[2]==1) {
        text(triello_risposta1[triello_index-1], width/10, (height/8)*6, (width/10)*4-10, (height/8));
      } else if (triello_pos[2]==2) {
        text(triello_risposta2[triello_index-1], width/10, (height/8)*6, (width/10)*4-10, (height/8));
      } else if (triello_pos[2]==3) {
        text(triello_risposta3[triello_index-1], width/10, (height/8)*6, (width/10)*4-10, (height/8));
      }

      if (ans4==0) {
        fill(255);
      } else if (ans4==1) {
        fill(255, 0, 0);
      } else if (ans4==2) {
        fill(0, 255, 0);
      } else if (ans4==3) {
        fill(255, 255, 0);
      }
      rect(width/10+(width/10)*4+10, (height/8)*6, (width/10)*4-10, (height/8));
      fill(0);
      textSize(70);
      if (triello_pos[3]==0) {
        text(triello_rispostaV[triello_index-1], width/10+(width/10)*4+10, (height/8)*6, (width/10)*4-10, (height/8));
      } else if (triello_pos[3]==1) {
        text(triello_risposta1[triello_index-1], width/10+(width/10)*4+10, (height/8)*6, (width/10)*4-10, (height/8));
      } else if (triello_pos[3]==2) {
        text(triello_risposta2[triello_index-1], width/10+(width/10)*4+10, (height/8)*6, (width/10)*4-10, (height/8));
      } else if (triello_pos[3]==3) {
        text(triello_risposta3[triello_index-1], width/10+(width/10)*4+10, (height/8)*6, (width/10)*4-10, (height/8));
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
      rect(width/10, (height/8)*5-20, (width/10)*4-10, (height/8));
      fill(0);
      textSize(70);
      if (triello_pos[0]==0) {
        text(triello_rispostaV[triello_index-1], width/10, (height/8)*5-20, (width/10)*4-10, (height/8));
      } else if (triello_pos[0]==1) {
        text(triello_risposta1[triello_index-1], width/10, (height/8)*5-20, (width/10)*4-10, (height/8));
      } else if (triello_pos[0]==2) {
        text(triello_risposta2[triello_index-1], width/10, (height/8)*5-20, (width/10)*4-10, (height/8));
      } else if (triello_pos[0]==3) {
        text(triello_risposta3[triello_index-1], width/10, (height/8)*5-20, (width/10)*4-10, (height/8));
      }

      if (ans2==0) {
        fill(255);
      } else if (ans2==1) {
        fill(255, 0, 0);
      } else if (ans2==2) {
        fill(0, 255, 0);
      } else if (ans2==3) {
        fill(255, 255, 0);
      }
      rect(width/10+(width/10)*4+10, (height/8)*5-20, (width/10)*4-10, (height/8));
      fill(0);
      textSize(70);
      if (triello_pos[1]==0) {
        text(triello_rispostaV[triello_index-1], width/10+(width/10)*4+10, (height/8)*5-20, (width/10)*4-10, (height/8));
      } else if (triello_pos[1]==1) {
        text(triello_risposta1[triello_index-1], width/10+(width/10)*4+10, (height/8)*5-20, (width/10)*4-10, (height/8));
      } else if (triello_pos[1]==2) {
        text(triello_risposta2[triello_index-1], width/10+(width/10)*4+10, (height/8)*5-20, (width/10)*4-10, (height/8));
      } else if (triello_pos[1]==3) {
        text(triello_risposta3[triello_index-1], width/10+(width/10)*4+10, (height/8)*5-20, (width/10)*4-10, (height/8));
      }
    }
  } else if (screen==10&millis()-time0<5000) {// ce o non ce
    image(back, 0, 0, width, height);
    textAlign(CENTER, CENTER);
    fill(255);
    textSize(200);
    text("100 SECONDI", width/2, height/2);
  } else if (screen==10|screen==11) {
    image(back, 0, 0, width, height);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(160);
    if (((crono1-(millis()-crono1_t0))<0&run_crono1)|crono1==0) {
      run_crono1=false;
      crono1=0;
      if (millis()%1000<500) {
        noFill();
        stroke(0);
        rect(width/2-250, height/2-70, 500, 140);
        fill(255, 0, 0);
        rect(width/2-250, height/2-70, 500, 140);
        fill(0);
        text("00.000", width/2, height/2);
      } else {
        noFill();
        stroke(0);
        rect(width/2-250, height/2-70, 500, 140);
        fill(0);
        rect(width/2-250, height/2-70, 500, 140);
        fill(255, 0, 0);
        text("00.000", width/2, height/2);
      }
      if (screen==11&crono1<60000) {
        fill(255);
        text("GHIGLIOTTINA", width/2, height/4);
      }
    } else {
      if (run_crono1) {
        text((crono1-(millis()-crono1_t0))/1000+"."+(crono1-(millis()-crono1_t0))%1000, width/2, height/2);
        if (screen==11) {
          textSize(160);
          text("GHIGLIOTTINA", width/2, height/4);
        }
      } else {
        if (screen==11&crono1==60000) {
          text("GHIGLIOTTINA", width/2, height/2);
        } else {
          text(crono1/1000+"."+crono1%1000, width/2, height/2);
        }
      }
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

String[] load_data(String file, String[] data) {
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
      data=concat_string(data, line);
    }
  } while (line!=null);
  return data;
}

String[] load_chicomecosa(String file, String[] domanda, String[] elencoV, String[] elencoF, int out) {
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
      println(line);
    }
    catch(IOException e) {
      println("ioexception file");
      exit();
    }
    if (line!=null) {
      String [] temp=split(line, '|');
      domanda=concat_string(domanda, temp[0]);
      elencoV=concat_string(elencoV, temp[1]);
      elencoF=concat_string(elencoF, temp[2]);
    }
  } while (line!=null);

  if (out==0) {
    return domanda;
  } else if (out==1) {
    return elencoV;
  } else if (out==2) {
    return elencoF;
  } else {
    return domanda;
  }
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
  if (sigla.isPlaying()) {
    sigla.stop();
  }
  if (tempo.isPlaying()) {
    tempo.stop();
  }
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
  } else if (screen==2|screen==4|screen==6|screen==8) {
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
  } else if (screen==3) {
    chicomecosa_index=(int)random(chicomecosa_domande.length);
    shuffle(chicomecosa_pos);
    ans1=0;
    ans2=0;
  } else if (screen==5) {
    data_anno=(int)random(4);
    ans1=0;
    ans2=0;
    ans3=0;
    ans4=0;
    if (data_anno==0) {
      data_index=(int)random(data_1971.length);
    } else if (data_anno==1) {
      data_index=(int)random(data_1987.length);
    } else if (data_anno==2) {
      data_index=(int)random(data_1995.length);
    } else if (data_anno==3) {
      data_index=(int)random(data_2000.length);
    }
  } else if (screen==9) {
    triello_used[0]=false;
    triello_used[1]=false;
    triello_used[2]=false;
    triello_used[3]=false;
    triello_used[4]=false;
    triello_used[5]=false;
    triello_used[6]=false;
    triello.loop();
  } else if (screen==10) {
    run_crono1=false;
    crono1=100000;
  } else if (screen==11) {
    run_crono1=false;
    crono1=60000;
    //ghi_start.play();
  }
  if (screen!=9&triello.isPlaying()) {
    triello.stop();
  } else if (screen!=1) {
    if (attori.isPlaying()) {
      attori.stop();
    } else if (film.isPlaying()) {
      film.stop();
    } else  if (libri.isPlaying()) {
      libri.stop();
    } else if (comuni.isPlaying()) {
      comuni.stop();
    }
  }
}

void drawn() {
  if (screen==0) {
    image(back, 0, 0, width, height);
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
    image(back, 0, 0, width, height);
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
  println(key);
  if (key=='s') {
    screen--;
    if (screen<0) {
      screen=11;
    }
    init();
    time0=millis();
  } else if (key=='d') {
    screen++;
    init();
    if (screen>11) {
      screen=0;
    }
    time0=millis();
  } else if (key=='a') {
    if (screen==3) {
      chicomecosa_index=(int)random(chicomecosa_domande.length);
      shuffle(chicomecosa_pos);
      ans1=0;
      ans2=0;
    } else if (screen==5) {
      if (ans1==3|ans2==3|ans3==3|ans4==3) {
        if (ans1==3) {
          ans1=0;
        }
        if (ans2==3) {
          ans2=0;
        }
        if (ans3==3) {
          ans3=0;
        }
        if (ans4==3) {
          ans4=0;
        }
      } else {
        data_anno=(int)random(4);
        ans1=0;
        ans2=0;
        ans3=0;
        ans4=0;
        if (data_anno==0) {
          data_index=(int)random(data_1971.length);
        } else if (data_anno==1) {
          data_index=(int)random(data_1987.length);
        } else if (data_anno==2) {
          data_index=(int)random(data_1995.length);
        } else if (data_anno==3) {
          data_index=(int)random(data_2000.length);
        }
      }
    } else if (screen==9) {
      if (ans1==3|ans2==3|ans3==3|ans4==3) {
        if (ans1==3) {
          ans1=0;
        }
        if (ans2==3) {
          ans2=0;
        }
        if (ans3==3) {
          ans3=0;
        }
        if (ans4==3) {
          ans4=0;
        }
      } else {
        triello_index=0;
        ans1=0;
        ans2=0;
        ans3=0;
        ans4=0;
      }
    }
  } else if (key=='z') {
    if (screen==1) {
      if (ans1==0&ans2==0) {
        ans1=3;
      } else if (ans1==3) {
        if (risposta) {
          ans1=2;
          esatto.play();
        } else {
          sbagliato.play();
          ans1=1;
          ans2=2;
        }
      } else if (ans1==0&ans2==3) {
        ans1=3;
        ans2=0;
      }
    } else if (screen==2|screen==4|screen==6|screen==8) {
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
          indice_sfida2=(int)random(parole.length);
          show2=new boolean[parole[indice_sfida2].length()];
          show2[0]=true;
        }
      }
    } else if (screen==3) {
      if (ans1==0&ans2==0) {
        ans1=3;
      } else if (ans1==3) {
        if (chicomecosa_pos[0]==0) {
          ans1=2;
          esatto.play();
        } else {
          sbagliato.play();
          ans1=1;
          ans2=2;
        }
      } else if (ans1==0&ans2==3) {
        ans1=3;
        ans2=0;
      }
    } else if (screen==5) {
      if (ans1==0&!(ans2==3|ans3==3|ans4==3)) {
        ans1=3;
      } else if (ans1==3) {
        if (data_anno==0) {
          ans1=2;
          esatto.play();
        } else {
          ans1=1;
          sbagliato.play();
          if (ans2==1&ans3==1) {
            ans4=2;
          } else if (ans4==1&ans3==1) {
            ans2=2;
          } else if (ans2==1&ans4==1) {
            ans3=2;
          }
        }
      }
    } else if (screen==9) {
      if (ans4==0&!(ans2==3|ans3==3|ans1==3)) {
        ans1=3;
      } else if (ans1==3) {
        if (triello_pos[0]==0) {
          ans1=2;
          esatto.play();
        } else {
          ans1=1;
          sbagliato.play();
          if (ans2==1&ans3==1) {
            ans4=2;
          } else if (ans4==1&ans3==1) {
            ans2=2;
          } else if (ans2==1&ans4==1) {
            ans3=2;
          }
        }
      }
    } else if (screen==10||screen==11) {
      if (run_crono1) {
        run_crono1=false;
        crono1=crono1-(millis()-crono1_t0);
        if (screen==11) {
          ghi_minuto.pause();
        }
      } else {
        crono1_t0=millis();
        run_crono1=true;
        if (screen==11) {
          ghi_minuto.play();
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
          esatto.play();
        } else {
          sbagliato.play();
          ans2=1;
          ans1=2;
        }
      } else if (ans2==0&ans1==3) {
        ans2=3;
        ans1=0;
      }
    } else if (screen==2|screen==4|screen==4) {
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
          indice_sfida1=(int)random(parole.length);
          show1=new boolean[parole[indice_sfida1].length()];
          show1[0]=true;
        }
      }
    } else if (screen==3) {
      if (ans2==0&ans1==0) {
        ans2=3;
      } else if (ans2==3) {
        if (chicomecosa_pos[1]==0) {
          ans2=2;
          esatto.play();
        } else {
          sbagliato.play();
          ans2=1;
          ans1=2;
        }
      } else if (ans2==0&ans1==3) {
        ans2=3;
        ans1=0;
      }
    } else if (screen==5) {
      if (ans2==0&!(ans1==3|ans3==3|ans4==3)) {
        ans2=3;
      } else if (ans2==3) {
        if (data_anno==1) {
          ans2=2;
          esatto.play();
        } else {
          ans2=1;
          sbagliato.play();
          if (ans1==1&ans3==1) {
            ans4=2;
          } else if (ans4==1&ans3==1) {
            ans1=2;
          } else if (ans1==1&ans4==1) {
            ans3=2;
          }
        }
      }
    } else if (screen==9) {
      if (ans2==0&!(ans1==3|ans3==3|ans4==3)) {
        ans2=3;
      } else if (ans2==3) {
        if (triello_pos[1]==0) {
          ans2=2;
          esatto.play();
        } else {
          ans2=1;
          sbagliato.play();
          if (ans1==1&ans3==1) {
            ans4=2;
          } else if (ans4==1&ans3==1) {
            ans1=2;
          } else if (ans1==1&ans4==1) {
            ans3=2;
          }
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
    } else if (screen==5) {
      if (ans3==0&!(ans2==3|ans1==3|ans4==3)) {
        ans3=3;
      } else if (ans3==3) {
        if (data_anno==2) {
          ans3=2;
          esatto.play();
        } else {
          ans3=1;
          sbagliato.play();
          if (ans2==1&ans1==1) {
            ans4=2;
          } else if (ans4==1&ans1==1) {
            ans2=2;
          } else if (ans2==1&ans4==1) {
            ans1=2;
          }
        }
      }
    } else if (screen==9) {
      if (ans3==0&!(ans2==3|ans1==3|ans4==3)) {
        ans3=3;
      } else if (ans3==3) {
        if (triello_pos[2]==0) {
          ans3=2;
          esatto.play();
        } else {
          ans3=1;
          sbagliato.play();
          if (ans2==1&ans1==1) {
            ans4=2;
          } else if (ans4==1&ans1==1) {
            ans2=2;
          } else if (ans2==1&ans4==1) {
            ans1=2;
          }
        }
      }
    }
  } else if (key=='v') {
    if (screen==5) {
      if (ans4==0&!(ans2==3|ans3==3|ans1==3)) {
        ans4=3;
      } else if (ans4==3) {
        if (data_anno==3) {
          ans4=2;
          esatto.play();
        } else {
          ans4=1;
          sbagliato.play();
          if (ans2==1&ans3==1) {
            ans1=2;
          } else if (ans1==1&ans3==1) {
            ans2=2;
          } else if (ans2==1&ans1==1) {
            ans3=2;
          }
        }
      }
    } else if (screen==9) {
      if (ans4==0&!(ans2==3|ans3==3|ans1==3)) {
        ans4=3;
      } else if (ans4==3) {
        if (triello_pos[3]==0) {
          ans4=2;
          esatto.play();
        } else {
          ans4=1;
          sbagliato.play();
          if (ans2==1&ans3==1) {
            ans1=2;
          } else if (ans1==1&ans3==1) {
            ans2=2;
          } else if (ans2==1&ans1==1) {
            ans3=2;
          }
        }
      }
    }
  } else if (key=='1') {
    triello_index=1;
    ans1=0;
    ans2=0;
    ans3=0;
    ans4=0;
    triello_used[0]=true;
    shuffle(triello_pos);
  } else if (key=='2') {
    triello_index=2;
    ans1=0;
    ans2=0;
    ans3=0;
    ans4=0;
    triello_used[1]=true;
    shuffle(triello_pos);
  } else if (key=='3') {
    triello_index=3;
    ans1=0;
    ans2=0;
    ans3=0;
    ans4=0;
    triello_used[2]=true;
    shuffle(triello_pos);
  } else if (key=='4') {
    triello_index=4;
    ans1=0;
    ans2=0;
    ans3=0;
    ans4=0;
    triello_used[3]=true;
    shuffle(triello_pos);
  } else if (key=='5') {
    triello_index=5;
    ans1=0;
    ans2=0;
    ans3=0;
    ans4=0;
    triello_used[4]=true;
    shuffle(triello_pos);
  } else if (key=='6') {
    triello_index=6;
    ans1=0;
    ans2=0;
    ans3=0;
    ans4=0;
    triello_used[5]=true;
    shuffle(triello_pos);
  } else if (key=='7') {
    triello_index=7;
    ans1=0;
    ans2=0;
    ans3=0;
    ans4=0;
    triello_used[6]=true;
    shuffle(triello_pos);
  } else if (key=='y') {
    doppio.play();
  } else if (key=='u') {
    aumento.play();
  } else if (key=='h') {
    ghi_ok.play();
  } else if (key=='j') {
    ghi_nok.play();
  } else if (key=='l') {
    if (ghi_minuto.isPlaying()) {
      ghi_minuto.pause();
    }
    ghi_vittoria.play();
  } else if (key=='o') {
    if (sigla.isPlaying()) {
      sigla.pause();
    }
    if (tempo.isPlaying()) {
      tempo.pause();
    }
    if (doppio.isPlaying()) {
      doppio.pause();
    }
    if (aumento.isPlaying()) {
      aumento.pause();
    }
    if (esatto.isPlaying()) {
      esatto.pause();
    }
    if (sbagliato.isPlaying()) {
      sbagliato.pause();
    }
    if (libri.isPlaying()) {
      libri.pause();
    }
    if (film.isPlaying()) {
      film.pause();
    }
    if (comuni.isPlaying()) {
      comuni.pause();
    }
    if (attori.isPlaying()) {
      attori.pause();
    }
    if (ghi_start.isPlaying()) {
      ghi_start.pause();
    }
    if (ghi_ok.isPlaying()) {
      ghi_ok.pause();
    }
    if (ghi_nok.isPlaying()) {
      ghi_nok.pause();
    }
    if (ghi_minuto.isPlaying()) {
      ghi_minuto.pause();
    }
    if (ghi_vittoria.isPlaying()) {
      ghi_vittoria.pause();
    }
    if (triello.isPlaying()) {
      triello.pause();
    }
  }
}
