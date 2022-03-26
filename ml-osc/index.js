/*
const OSC = require('osc-js')

const osc = new OSC({
    plugin: new OSC.DatagramPlugin({ send: { port: 4560, host: '127.0.0.1' } })
  });

  osc.open();

  osc.on('/test', message => {
    console.log("angekommen")
  })

while(true){
    const message = new OSC.Message('/test', 88.221, 'hello')
    osc.send(message) 
    console.log("msg send")
}
*/

import { Client } from 'node-osc';

const client = new Client('127.0.0.1', 4560);
while(true){
    client.send('/test', 200, () => {
        client.close();
      });
    console.log("msg send")
}
