db = db.getSiblingDB('admin');
db.createUser(
    {
        user: "admin",
        pwd: "XRYs9yjU",
        roles: [ { role: "root", db: "admin" } ]
    }
);
db.auth("admin","XRYs9yjU");
db = db.getSiblingDB('otus');
db.createUser(
    {
        user: "otus",
        pwd: "a9J1sVtL",
        roles: [ { role: "dbAdmin", db: "otus" } ]
    }
);
db.createCollection("activity");
db.createCollection("activity_configuration");
db.createCollection("auditor");
db.createCollection("datasource");
db.createCollection("exam_lot");
db.createCollection("exam_result");
db.createCollection("exam_result_lot");
db.createCollection("exam_sending_lot");
db.createCollection("field_center");
db.createCollection("filestore.chunks");
db.createCollection("filestore.files");
db.createCollection("laboratory_configuration");
db.createCollection("participant");
db.createCollection("participant_laboratory");
db.createCollection("participant_quality_control");
db.createCollection("report");
db.createCollection("survey");
db.createCollection("system_config");
db.createCollection("transportation_lot");
db.createCollection("user");
db = db.getSiblingDB('otus-domain');
db.createUser(
    {
        user: "otus",
        pwd: "fLACLaFL",
        roles: [ { role: "dbAdmin", db: "otus-domain" } ]
    }
);
db.createCollection("auditor");
db.createCollection("EmailSender");
db.createCollection("Projec");
db.createCollection("Repository");
db.createCollection("system_config");
db.createCollection("user");