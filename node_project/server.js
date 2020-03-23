'use strict';

const express = require('express');

// константы
const PORT = 8080;
const host = '0.0.0.0';

// приложение
const http = require('http');
const { createTerminus } = require('@godaddy/terminus');

function onSignal () {
  console.log('server is starting cleanup');
  return Promise.all([
    // your clean logic, like closing database connections
  ]);
}

function onShutdown () {
  console.log('cleanup finished, server is shutting down');
}

function healthCheck () {
  return Promise.resolve(
    // optionally include a resolve value to be included as
    // info in the health check response
  )
}

const server = http.createServer((request, response) => {
  response.end(
    `<html>
      <body>
        <h1>Hello, World!</h1>
       </body>
     </html>`
   );
})

const options = {
  // health check options
  healthChecks: {
    '/healthcheck': healthCheck,    // a function returning a promise indicating service health,
    verbatim: true // [optional = false] use object returned from /healthcheck verbatim in response
  },
  caseInsensitive, // [optional] whether given health checks routes are case insensitive (defaults to false) 

  // cleanup options
  timeout: 1000,                   // [optional = 1000] number of milliseconds before forceful exiting
  signal,                          // [optional = 'SIGTERM'] what signal to listen for relative to shutdown
  signals,                         // [optional = []] array of signals to listen for relative to shutdown
  beforeShutdown,                  // [optional] called before the HTTP server starts its shutdown
  onSignal,                        // [optional] cleanup function, returning a promise (used to be onSigterm)
  onShutdown,                      // [optional] called right before exiting
  onSendFailureDuringShutdown,     // [optional] called before sending each 503 during shutdowns

  // both
  logger                           // [optional] logger function to be called with errors
};

createTerminus(server, options);

server.listen(PORT || 3000);

console.log(`running on http://${host}:${port}`);