db = db.getSiblingDB('admin');
db.createUser({
  user: "admin",
  pwd: "XRYs9yjU",
  roles: [{
    role: "root",
    db: "admin"
  }]
});
db.auth("admin", "XRYs9yjU");

db = db.getSiblingDB('otus');
db.createUser({
  user: "otus",
  pwd: "a9J1sVtL",
  roles: [{
    role: "dbOwner",
    db: "otus"
  }]
});

db = db.getSiblingDB('otus-domain');
db.createUser({
  user: "otus",
  pwd: "fLACLaFL",
  roles: [{
    role: "dbOwner",
    db: "otus-domain"
  }]
});
