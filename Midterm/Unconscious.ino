/*My midterm project for Intro To IM: The Iceberg of The Unconscious

   Tutorial used for turning on multiple LEDs with one fsr sensor:https://www.youtube.com/watch?v=YkVWWRuUyFo
   inspirations: https://wp.nyu.edu/abudhabi_im_intro/author/aka421-2-2-2-2/;https://wp.nyu.edu/abudhabi_im_intro/2019/09/08/red-or-green/
*/

//The sensor pin and its value for Freud's nose
const int fsrPin = 0;
int fsrValue;


//LED pins for the iceberg
const int LED1 = 11;
const int LED2 = 10;
const int LED3 = 9;
const int LED4 = 6;
const int LED5 = 5;
//LED pins for Freud's nose
const int NOSE = 3;


//Boolean to detect whether LED lights are off to make blinking effective
bool ledoff = true;

//Millis for time delay for the blinking of LEDs
unsigned long previousMillis = 0;
long interval = 1000;


//analog pin used to connect the potentionmeter and its value
int potpin = A3;
int val;

void setup() {
  pinMode(NOSE, OUTPUT);
  pinMode(LED1, OUTPUT);
  pinMode(LED2, OUTPUT);
  pinMode(LED3, OUTPUT);
  pinMode(LED4, OUTPUT);
  pinMode(LED5, OUTPUT);
  pinMode(potpin, INPUT);
  Serial.begin(9600);
}

//function that turn on all the LEDs to avoid typing the same things out over and over

void turnON() {
  analogWrite(LED1, 255);
  analogWrite(LED2, 255);
  analogWrite(LED3, 255);
  analogWrite(LED4, 255);
  analogWrite(LED5, 255);
}

//A similar thing: function that turn off all the LEDs to avoid typing the same things out over and over


void turnOFF() {
  analogWrite(LED1, 0);
  analogWrite(LED2, 0);
  analogWrite(LED3, 0);
  analogWrite(LED4, 0);
  analogWrite(LED5, 0);
}


void loop() {
  //read sensor input
  fsrValue = analogRead(fsrPin);
  //maps sensor input to an LED light spectrum so when the user put pressure on the sensor, the spectrum of values will correspond to that of the nose LED.
  fsrValue = map(fsrValue, 0, 980, 0, 255);

  //the potentionmeter feature to adjust blinking frequencies
  val = analogRead(potpin);
  val = map(val, 0, 1023, 50, 500); //set a range of how fast the LEDs are blinking
  interval = val; //assigning the value to the interval

  //a serial print for testing purposes
  Serial.println(fsrValue);

  //if Freud's nose is touched
  if (fsrValue > 10) {

    //the yellow LED that lights up Freud's nose is equivalent to the fsr Value
    analogWrite(NOSE, fsrValue);

    //starts counting milliseconds
    unsigned long currentMillis = millis();
    //if the period interval passes and the led is off, it will be turned on, and vice versa
    if (currentMillis - previousMillis >= interval) {
      // save the last time you blinked the LED
      previousMillis = currentMillis;

      if (ledoff == true) {
        turnON();
        ledoff = false;
      } else {
        turnOFF();
        ledoff = true;
      }
    }

  } else { //if Freud's nose is not touched, all the LED lights are off. 
    turnOFF();
    ledoff = true;
    analogWrite(NOSE, 0);
  }

}
