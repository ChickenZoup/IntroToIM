/*My project for creating an instrument.

  inspirations: https://wp.nyu.edu/abudhabi_im_intro/2019/09/23/tiny-orchestra/
                https://wp.nyu.edu/abudhabi_im_intro/author/jsc717-2-2-2-2/

  inspiration for melody: https://create.arduino.cc/editor/chelsiea/3400b009-0a50-4a22-8394-f91d47d7981b/preview

  melody 1: https://www.princetronics.com/supermariothemesong/


*/

#include "pitches.h" //add note library


//below is the melody played when the yellow button is pressed, a lil imposition piece

int melody[ ] = {
  NOTE_C4, NOTE_G3, NOTE_G3, NOTE_A3, NOTE_G3, 0, NOTE_B3, NOTE_C4, 0, NOTE_G3, NOTE_A3, NOTE_A3, 0, NOTE_B3, NOTE_C4
};

int noteDurations[ ] {
  4, 8, 8, 4, 4, 4, 4, 4, 8, 8, 4, 4, 8, 8, 4, 4, 4, 8,
};

//when the red button is pressed, the underground theme for mario will be played
int melody1[] = {
  NOTE_C4, NOTE_C5, NOTE_A3, NOTE_A4,
  NOTE_AS3, NOTE_AS4, 0,
  0,
  NOTE_C4, NOTE_C5, NOTE_A3, NOTE_A4,
  NOTE_AS3, NOTE_AS4, 0,
  0,
  NOTE_F3, NOTE_F4, NOTE_D3, NOTE_D4,
  NOTE_DS3, NOTE_DS4, 0,
  0,
  NOTE_F3, NOTE_F4, NOTE_D3, NOTE_D4,
  NOTE_DS3, NOTE_DS4, 0,
  0, NOTE_DS4, NOTE_CS4, NOTE_D4,
  NOTE_CS4, NOTE_DS4,
  NOTE_DS4, NOTE_GS3,
  NOTE_G3, NOTE_CS4,
  NOTE_C4, NOTE_FS4, NOTE_F4, NOTE_E3, NOTE_AS4, NOTE_A4,
  NOTE_GS4, NOTE_DS4, NOTE_B3,
  NOTE_AS3, NOTE_A3, NOTE_GS3,
  0, 0, 0
};

int melody1_beat[] = {
  12, 12, 12, 12,
  12, 12, 6,
  3,
  12, 12, 12, 12,
  12, 12, 6,
  3,
  12, 12, 12, 12,
  12, 12, 6,
  3,
  12, 12, 12, 12,
  12, 12, 6,
  6, 18, 18, 18,
  6, 6,
  6, 6,
  6, 6,
  18, 18, 18, 18, 18, 18,
  10, 10, 10,
  10, 10, 10,
  3, 3, 3
};

//initializing the buttons that corresponds to different melodies

const int yellow = 13;
const int red = 12;

//initializing servo, original position is set to 0
#include <Servo.h>
Servo myservo;
int potpin = 0;
int val; // variable to read the value from the analog pin

//initializing speaker
const int speaker = 7;


void setup() {
  pinMode(yellow, INPUT);
  pinMode(red, INPUT);
  pinMode(speaker, OUTPUT);
  myservo.attach(8); //attaches the servo on pin 8 to the servo object
}

void loop() {
  int yellowState = digitalRead(yellow);
  int redState = digitalRead(red);

  if (yellowState == 1) { //when the yellow button is pressed, melody is played
    for (int thisNote = 0; thisNote < 15; thisNote++) {
      //to calculate the note duration, take one second. Divided by the note type
      int noteDuration = 1000 / noteDurations [thisNote];
      tone(speaker, melody [thisNote], noteDuration);

      //to distinguish the notes, set a minimum time between them
      //the note's duration +30% seems to work well
      int pauseBetweenNotes = noteDuration * 1.30;
      delay(pauseBetweenNotes);

      //stop the tone playing
      noTone(speaker);

      //the set of dancing movements for the melody when the yellow button is pressed

      for (int i = 30; i < 50; i++) {
        myservo.write(i);                  // sets the servo position according to the scaled value
        delay(10);
      }

      for (int i = 50; i < 30; i++) {
        myservo.write(i);                  // sets the servo position according to the scaled value
        delay(10);
      }// waits for the servo to get


      delay(15);                           // waits for the servo to get
    }
  }

  if (redState == 1) { //when the red button is pressed, melody1 aka underground theme for Mario is played
    int size = sizeof(melody1) / sizeof(int);
    for (int thisNote = 0; thisNote < size; thisNote++) {

      // to calculate the note duration, take one second
      // divided by the note type.
      //e.g. quarter note = 1000 / 4, eighth note = 1000/8, etc.
      int noteDuration = 1000 / melody1_beat[thisNote];

      // to distinguish the notes, set a minimum time between them.
      // the note's duration + 30% seems to work well:
      int pauseBetweenNotes = noteDuration * 1.30;
      delay(pauseBetweenNotes);

      tone(speaker, melody1[thisNote], noteDuration);

      //the set of dancing movements for the melody when the red button is pressed
      for (int i = 20; i < 60; i++) {
        myservo.write(i);                  // sets the servo position according to the scaled value
        delay(5);
      }

      for (int i = 60; i < 20; i++) {
        myservo.write(i);                  // sets the servo position according to the scaled value
        delay(5);
      }// waits for the servo to get



    }

  }
}
