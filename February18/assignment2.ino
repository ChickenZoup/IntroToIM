
//inspiration https://www.browncountylibrary.org/wp-content/uploads/2018/03/arduino_potentiometer.pdf

int pushButton=12;
int buttonState=0;
int sensor=A3;
int yellowLED=6;
int greenLED=13;
int sensorValue;
int percent;

void setup() {
  // initialize serial communication at 9600 bits per second:
  Serial.begin(9600);
  pinMode(A3,INPUT);
  pinMode(12,INPUT);
  pinMode(6,OUTPUT);
  pinMode(13,OUTPUT);
}

void loop() {
  // read the input on analog pin 0:
  int sensorValue = analogRead(sensor);
  percent=map(sensorValue,0,1000,0,100);

// if the percentage is less than 50%, the yellow LED is on, otherwise, the green LED is on.
  if (percent<50){
    digitalWrite(yellowLED,HIGH);
    digitalWrite(greenLED,LOW);
  }

  if (percent>50){
    digitalWrite(yellowLED,LOW);
    digitalWrite(greenLED,HIGH);
  }

//A button to turn both the LEDs on 
buttonState=digitalRead(pushButton);
  if (buttonState==HIGH && 0<sensor<100){
    digitalWrite(yellowLED,HIGH);
    digitalWrite(greenLED,HIGH);
  }

Serial.println(sensorValue);
  delay(1);        // delay in between reads for stability
}
