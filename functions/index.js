const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

exports.helloWorld = functions.https.onRequest((request, response) => {
  functions.logger.info("Hello logs!", {structuredData: true});
  response.send("Hello from Firebase!");
});

exports.fetchUsers = functions.https.onRequest((req, res) => {
  admin.firestore().collection("users").get()
      .then((snapshot) => {
        const users = [];
        snapshot.forEach((doc) => {
          const userData = doc.data();
          userData.id = doc.id; // Add the document ID as the user ID
          users.push(userData);
        });
        res.status(200).json(users);
      })
      .catch((error) => {
        res.status(500).json({error: error.message});
      });
});
