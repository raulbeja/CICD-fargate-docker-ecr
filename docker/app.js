const express = require('express');

const app = express();
const PORT = process.env.PORT || 80;

const users = [
	{name: "Pepe", age: "30"},
	{name: "Juan", age: "40"}
]

app.get("/healthcheck", (request,response) => {
	response.status(200).send({data:"Good"});
	}
);

app.get("/", (request,response) => {
	response.status(200).send({data:users});
	}
);

app.listen (PORT,() => {
	console.log ('Listening at port: ${PORT}')
	}
);