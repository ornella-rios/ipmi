//ornella rios
//comision 1

 PImage imagen1, imagen2, imagen3;
PFont miFuente;

int pantalla = 0;
float tamTexto = 10;

// Para el fade en pantalla 2
int opacidad = 0;

// Para que el texto de créditos suba en pantalla 3
float yCreditos = 0;

// Para controlar si mostramos el botón de reinicio
int estado = 0;  // 0 = presentando, 1 = mostrar botón


void setup() {
  size(640, 480);
 
 // IMAGENES QUE VAN A APARECER EN LA PANTALLA
  imagen1 = loadImage("imagen1.jpg");
  imagen2 = loadImage("imagen2.jpg");
  imagen3 = loadImage("imagen3.jpg");

  miFuente = loadFont("Verdana-BoldItalic-48.vlw");
  textFont(miFuente);
  textAlign(CENTER, CENTER);

 
}

void draw() {
  background(0);

  //  PANTALLA 1 
  if (pantalla == 0) {
    image(imagen1, 0, 0, width, height);
    fill(255);
    textSize(tamTexto);
    text("RAPIDO Y FURIOSO", width/2, height/2);
    if (tamTexto < 55) {
      tamTexto += 0.7;
    }
  }

  //  PANTALLA 2 
  if (pantalla == 1) {
    image(imagen2, 0, 0, width, height);
    fill(255, opacidad);
    textSize(28);
    text("PERSONAJES PRINCIPALES", width/2, 50);

    textSize(20);
    String[] personajes = {
      "Dominic Toretto",
      "Brian O'Conner",
      "Letty Ortiz",
      "Mia Toretto",
      "Roman Pearce",
      "Tej Parker",
      "Han Lue",
      "Gisele Yashar",
      "Luke Hobbs",
      "Deckard Shaw"
    };

    for (int i = 0; i < personajes.length; i++) {
      text(personajes[i], width/2, 100 + i * 30);
    }

    if (opacidad < 255) opacidad += 3;
  }

  //  PANTALLA 3 
  if (pantalla == 2) {
    image(imagen3, 0, 0, width, height);
    fill(255);
    textSize(22);

    String[] creditos = {
      "CREDITOS PRINCIPALES",
      "",
      "Dirección", "Rob Cohen",
      "",
      "Producción", "Neal H. Moritz",
      "",
      "Guion", "Gary Scott Thompson", "Erik Bergquist", "David Ayer",
      "",
      "Basado en el artículo", "Racer X de Ken Li",
      "",
      "Reparto principal",
      "Vin Diesel como Dominic Toretto",
      "Paul Walker como Brian O'Conner",
      "Michelle Rodriguez como Letty Ortiz",
      "Jordana Brewster como Mia Toretto",
      "Rick Yune como Johnny Tran",
      "Chad Lindberg como Jesse",
      "Johnny Strong como Leon",
      "Matt Schulze como Vince",
      "Ja Rule como Edwin",
      "",
      "Música", "BT (Brian Transeau)",
      "",
      "Director de fotografía", "Ericson Core",
      "",
      "Montaje", "Peter Honess",
      "",
      "Diseño de producción", "Waldemar Kalinowski",
      "",
      "Vestuario", "Sanja Milkovic Hays",
      "",
      "Compañía productora", "Original Film", "Universal Pictures"
    };

    for (int i = 0; i < creditos.length; i++) {
      text(creditos[i], width/2, yCreditos + i * 30);
    }
  
    yCreditos -= 1.5;

    // Si los créditos ya subieron lo suficiente, mostramos botón
    if (yCreditos + creditos.length * 30 < height / 2) {
      estado = 1;
    }
  }

  //  CAMBIO AUTOMÁTICO DE PANTALLA 
  if (frameCount % 230 == 0 && pantalla < 2) {
    pantalla++;
    tamTexto = 10;
    opacidad = 0;
     yCreditos = height + 20;  // Los créditos comienzan fuera de pantalla
  }

  //  BOTÓN DE REINICIO 
  if (estado == 1) {
    fill(255);
    rect(width / 2 - 60, height - 80, 120, 40);
    fill(0);
    textSize(20);
    text("REINICIAR", width / 2, height - 60);
  }
}

void mousePressed() {
  if (estado == 1 &&
      mouseX > width/2 - 60 && mouseX < width/2 + 60 &&
      mouseY > height - 80 && mouseY < height - 40) {

    pantalla = 0;
    tamTexto = 10;
    opacidad = 0;
    yCreditos = height + 200;
    estado = 0;
  }
}
