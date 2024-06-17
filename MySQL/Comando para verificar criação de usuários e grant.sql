PT1
SELECT concat('SHOW CREATE USER `',User,'`@`',Host,'`;') txt FROM mysql.user;

PT2
SHOW CREATE USER `conazweb_root`@`%`;

PT3
SELECT concat('SHOW GRANTS FOR `',User,'`@`',Host,'`;') txt FROM mysql.user;

PT4
SHOW GRANTS FOR `conazweb_root`@`%`;