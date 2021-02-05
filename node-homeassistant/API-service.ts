function helloWorld(req: any, res: any) {
  res.json({ message: "Hello World!" });
}

module.exports = { helloWorld };
