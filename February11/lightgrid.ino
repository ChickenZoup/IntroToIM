
int pushButton = 9;
int pushButton2 = 8;
int count = 0;
int buttonState = 0;
int button2State = 0;

void setup() {
  // initialize serial communication at 9600 bits per second:
  Serial.begin(9600);
  pinMode(pushButton, INPUT);
  pinMode(pushButton2, INPUT);
  pinMode(13, OUTPUT);
  pinMode(12, OUTPUT);
  pinMode(11, OUTPUT);
  pinMode(10, OUTPUT);

}

// the loop routine runs over and over again forever:
void loop() {
  // read the input pin:
  buttonState = digitalRead(pushButton);
  button2State = digitalRead(pushButton2);

  if ((buttonState == HIGH) && (button2State==LOW)) { //if condition is true, meaning if the first button is pressed
    count++; //increment count by one
    Serial.print(count); //verifying that the count is having the correct outpot on LEDs

    if ((count % 2) != 0) { //the blinking effect
      digitalWrite(13, HIGH);
      digitalWrite(10, HIGH);
      digitalWrite(12, LOW);
      digitalWrite(11, LOW);
    }

    if ((count % 2) == 0) {
      digitalWrite(13, LOW);
      digitalWrite(10, LOW);
      digitalWrite(12, HIGH);
      digitalWrite(11, HIGH);
    }

    delay(100);
  }
  if ((buttonState == LOW) && (button2State == HIGH)) { //if the second button is pressed, all LED lights are on
    digitalWrite(13, HIGH);
    digitalWrite(10, HIGH);
    digitalWrite(12, HIGH);
    digitalWrite(11, HIGH);
  }


  if ((buttonState == HIGH) && (button2State == HIGH)) { //if both buttons are pressed, all LED lights are off
    digitalWrite(13, LOW);
    digitalWrite(12, LOW);
    digitalWrite(11, LOW);
    digitalWrite(10, LOW);
  }
  
 if ((buttonState == LOW) && (button2State == LOW)) {//if both buttons are not pressed, all LED lights are off
    digitalWrite(13, LOW); 
    digitalWrite(12, LOW);
    digitalWrite(11, LOW);
    digitalWrite(10, LOW);
  }
}




//reference: https://www.instructables.com/id/Build-a-Simple-Binary-Counter-using-your-Arduino/
