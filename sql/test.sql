CREATE TEMPORARY TABLE reward (     
aType VARCHAR(10) NOT NULL,
reward INTEGER NOT NULL
);
INSERT INTO tmp_table (aType,reward) VALUES ('1',1);
SELECT * FROM tmp_table;
