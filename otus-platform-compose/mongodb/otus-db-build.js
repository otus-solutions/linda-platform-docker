db = db.getSiblingDB('admin');

passAdmin = "XRYs9yjU";
passOtus = "a9J1sVtL";
passDomain = "fLACLaFL";

db.createUser({
  user: "admin",
  pwd: passAdmin,
  roles: [{
    role: "root",
    db: "admin"
  }]
});
db.auth("admin", passAdmin);

db = db.getSiblingDB('otus');
db.createUser({
  user: "otus",
  pwd: passOtus,
  roles: [{
    role: "dbOwner",
    db: "otus"
  }]
});

db = db.getSiblingDB('otus-domain');
db.createUser({
  user: "otus",
  pwd: passDomain,
  roles: [{
    role: "dbOwner",
    db: "otus-domain"
  }]
});
