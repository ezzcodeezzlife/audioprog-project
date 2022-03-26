
/**
 * oscP5sendreceive by andreas schlegel
 * example shows how to send and receive osc messages.
 * oscP5 website at http://www.sojamo.de/oscP5
 */
 
import oscP5.*;
import netP5.*;
import controlP5.*;


// atk
// rel
// volume

OscP5 oscP5;
ControlP5 cp5;

NetAddress myRemoteLocation;

Knob baseAmpKnob;
Knob pan;


Knob atk1;
Knob rel1;
Textlabel label1;
Slider amp;
Textfield einseins;
Textfield einszwei;
Textfield einsdrei;
Textfield einsvier;

Knob atk2;
Knob rel2;
Textlabel label2;
Slider amp2;
Textfield zweieins;
Textfield zweizwei;
Textfield zweidrei;
Textfield zweivier;

Knob atk3;
Knob rel3;
Textlabel label3;
Slider amp3;
Textfield dreieins;
Textfield dreizwei;
Textfield dreidrei;
Textfield dreivier;

void setup() {
 size(500,330);
 frameRate(25);
 /* start oscP5, listening for incoming messages at port 12000 */
 oscP5 = new OscP5(this,4560);

myRemoteLocation = new NetAddress("127.0.0.1",4560);

cp5 = new ControlP5(this);
  
baseAmpKnob = cp5.addKnob("Speed")
 .setRange(0.1,10)
 .setValue(1.1)
 .setPosition(10, 10)
 .setRadius(10)
 .setHeight(30)
 .setSize(60,60)
 .setColorForeground(#8be9fd)
 .setColorBackground(#282a36)
 .setColorActive(#50fa7b)
;

pan = cp5.addKnob("pan")
 .setRange(-1,1)
 .setValue(0)
 .setPosition(10, 100)
 .setRadius(10)
 .setHeight(30)
 .setSize(60,60)
 .setColorForeground(#8be9fd)
 .setColorBackground(#282a36)
 .setColorActive(#50fa7b)
;


//1
atk1 = cp5.addKnob("atk1")
.setRange(0.1,5)
 .setValue(1)
 .setPosition(100, 20) 
 .setColorForeground(#8be9fd)
 .setColorBackground(#282a36)
 .setColorActive(#50fa7b)
;

rel1 = cp5.addKnob("rel1")
.setRange(0.1,5)
 .setValue(1)
 .setPosition(100, 80) 
 .setColorForeground(#8be9fd)
 .setColorBackground(#282a36)
 .setColorActive(#50fa7b)
;             

label1 = cp5.addTextlabel("label1")
.setValue("Nichts - Synth 1")
.setPosition(100, 5); 

amp = cp5.addSlider("amp")
.setMax(10)
.setMin(0)
.setValue(1)
.setPosition(80,140);

einseins = cp5.addTextfield("1-1")
.setText("55")
.setWidth(40)
.setPosition(100,160);
einszwei = cp5.addTextfield("1-2")
.setText("55")
.setWidth(40)
.setPosition(100,200);
einsdrei = cp5.addTextfield("1-3")
.setText("55")
.setWidth(40)
.setPosition(100,240);
einsvier = cp5.addTextfield("1-4")
.setText("55")
.setWidth(40)
.setPosition(100,280);

//2
atk2 = cp5.addKnob("atk2")
.setRange(0.1,5)
 .setValue(1)
 .setPosition(220, 20) 
 .setColorForeground(#8be9fd)
 .setColorBackground(#282a36)
 .setColorActive(#50fa7b)
;

rel2 = cp5.addKnob("rel2")
.setRange(0.1,5)
 .setValue(1)
 .setPosition(220, 80) 
 .setColorForeground(#8be9fd)
 .setColorBackground(#282a36)
 .setColorActive(#50fa7b)
;             

label2 = cp5.addTextlabel("label2")
.setValue("Faust - Synth 2")
.setPosition(220, 5); 

amp2 = cp5.addSlider("amp2")
.setMax(10)
.setMin(0)
.setValue(1)
.setPosition(180,140);

zweieins = cp5.addTextfield("2-1")
.setText("55")
.setWidth(40)
.setPosition(220,160);
zweizwei = cp5.addTextfield("2-2")
.setText("55")
.setWidth(40)
.setPosition(220,200);
zweidrei = cp5.addTextfield("2-3")
.setText("55")
.setWidth(40)
.setPosition(220,240);
zweivier = cp5.addTextfield("2-4")
.setText("55")
.setWidth(40)
.setPosition(220,280);

//3
atk3 = cp5.addKnob("atk3")
.setRange(0.1,5)
 .setValue(1)
 .setPosition(340, 20) 
 .setColorForeground(#8be9fd)
 .setColorBackground(#282a36)
 .setColorActive(#50fa7b)
;

rel3 = cp5.addKnob("rel3")
.setRange(0.1,5)
 .setValue(1)
 .setPosition(340, 80) 
 .setColorForeground(#8be9fd)
 .setColorBackground(#282a36)
 .setColorActive(#50fa7b)
;             

label3 = cp5.addTextlabel("label3")
.setValue("Finger - Synth 3")
.setPosition(340, 5); 

amp3 = cp5.addSlider("amp3")
.setMax(10)
.setMin(0)
.setValue(1)
.setPosition(300,140);

dreieins = cp5.addTextfield("3-1")
.setText("55")
.setWidth(40)
.setPosition(340,160);
dreizwei = cp5.addTextfield("3-2")
.setText("55")
.setWidth(40)
.setPosition(340,200);
dreidrei = cp5.addTextfield("3-3")
.setText("55")
.setWidth(40)
.setPosition(340,240);
dreivier = cp5.addTextfield("3-4")
.setText("55")
.setWidth(40)
.setPosition(340,280);


}


 void draw() {
  background(0);  
}

void mousePressed() {
  println("pressed");
  //Send BPM
  OscMessage bpmMessage = new OscMessage("/bpm");
  float bpm = baseAmpKnob.getValue();
  bpmMessage.add(bpm);
  oscP5.send(bpmMessage, myRemoteLocation);
  
    //Send pan
  OscMessage panMessage = new OscMessage("/pan");
  float panvar = pan.getValue();
  panMessage.add(panvar);
  oscP5.send(panMessage, myRemoteLocation);
  
  //1
  //Send atk1
  OscMessage atkMessage = new OscMessage("/atk1");
  float atk1var = atk1.getValue();
  atkMessage.add(atk1var);
  oscP5.send(atkMessage, myRemoteLocation);
  
  //Send Release rel1
  OscMessage relMessage = new OscMessage("/rel1");
  float rel1var = rel1.getValue();
   relMessage.add(rel1var);
  oscP5.send(relMessage, myRemoteLocation);
  
  //Send amp1
  OscMessage amp1Message = new OscMessage("/amp1");
  float amp1var = amp.getValue();
   amp1Message.add(amp1var);
  oscP5.send(amp1Message, myRemoteLocation);
   
  //Send pitch 1
  OscMessage einseinsMessage = new OscMessage("/einseins");
  float einseinsvar = float(einseins.getText());
  einseinsMessage.add(einseinsvar);
  oscP5.send(einseinsMessage, myRemoteLocation);
 
  OscMessage einszweiMessage = new OscMessage("/einszwei");
  float einszweivar = float(einszwei.getText());
  einszweiMessage.add(einszweivar);
  oscP5.send(einszweiMessage, myRemoteLocation);
   
  OscMessage einsdreiMessage = new OscMessage("/einsdrei");
  float einsdreivar = float(einsdrei.getText());
  einsdreiMessage.add(einsdreivar);
  oscP5.send(einsdreiMessage, myRemoteLocation);
   
  OscMessage einsvierMessage = new OscMessage("/einsvier");
  float einsviervar = float(einsvier.getText());
  einsvierMessage.add(einsviervar);
  oscP5.send(einsvierMessage, myRemoteLocation);



  //2
  //Send atk2
  OscMessage atkMessage2 = new OscMessage("/atk2");
  float atk1var2 = atk2.getValue();
  atkMessage2.add(atk1var2);
  oscP5.send(atkMessage2, myRemoteLocation);
  
  //Send Release rel2
  OscMessage relMessage2 = new OscMessage("/rel2");
  float rel1var2 = rel1.getValue();
  relMessage2.add(rel1var2);
  oscP5.send(relMessage2, myRemoteLocation);
  
  //Send amp2
  OscMessage amp1Message2 = new OscMessage("/amp2");
  float amp1var2 = amp.getValue();
  amp1Message2.add(amp1var2);
  oscP5.send(amp1Message2, myRemoteLocation);
  
  //Send pitch 2
  OscMessage zweieinsMessage = new OscMessage("/zweieins");
  float zweieinsvar = float(zweieins.getText());
  zweieinsMessage.add(zweieinsvar);
  oscP5.send(zweieinsMessage, myRemoteLocation);
 
  OscMessage zweizweiMessage = new OscMessage("/zweizwei");
  float zweizweivar = float(zweizwei.getText());
  zweizweiMessage.add(zweizweivar);
  oscP5.send(zweizweiMessage, myRemoteLocation);
   
  OscMessage zweidreiMessage = new OscMessage("/zweidrei");
  float zweidreivar = float(zweidrei.getText());
  zweidreiMessage.add(zweidreivar);
  oscP5.send(zweidreiMessage, myRemoteLocation);
   
  OscMessage zweivierMessage = new OscMessage("/zweivier");
  float zweiviervar = float(zweivier.getText());
  zweivierMessage.add(zweiviervar);
  oscP5.send(zweivierMessage, myRemoteLocation);


  
   //3
  //Send atk3
  OscMessage atkMessage3 = new OscMessage("/atk3");
  float atk1var3 = atk1.getValue();
  atkMessage3.add(atk1var3);
  oscP5.send(atkMessage3, myRemoteLocation);
  
  //Send Release rel2
  OscMessage relMessage3 = new OscMessage("/rel2");
  float rel1var3 = rel1.getValue();
   relMessage3.add(rel1var3);
  oscP5.send(relMessage3, myRemoteLocation);
  
  //Send amp2
  OscMessage amp1Message3 = new OscMessage("/amp2");
  float amp1var3 = amp.getValue();
  amp1Message3.add(amp1var3);
  oscP5.send(amp1Message3, myRemoteLocation);
  
    //Send pitch 3
  OscMessage dreieinsMessage = new OscMessage("/dreieins");
  float dreieinsvar = float(dreieins.getText());
  dreieinsMessage.add(dreieinsvar);
  oscP5.send(dreieinsMessage, myRemoteLocation);
 
  OscMessage dreizweiMessage = new OscMessage("/dreizwei");
  float dreizweivar = float(dreizwei.getText());
  dreizweiMessage.add(dreizweivar);
  oscP5.send(zweizweiMessage, myRemoteLocation);
   
  OscMessage dreidreiMessage = new OscMessage("/dreidrei");
  float dreidreivar = float(dreidrei.getText());
  dreidreiMessage.add(dreidreivar);
  oscP5.send(dreidreiMessage, myRemoteLocation);
   
  OscMessage dreivierMessage = new OscMessage("/dreivier");
  float dreiviervar = float(dreivier.getText());
  dreivierMessage.add(dreiviervar);
  oscP5.send(dreivierMessage, myRemoteLocation);

     


 }


/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
 /* print the address pattern and the typetag of the received OscMessage */
 print("### received an osc message.");
 print(" addrpattern: "+theOscMessage.addrPattern());
 println(" typetag: "+theOscMessage.typetag());
}
