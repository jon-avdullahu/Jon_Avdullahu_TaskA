Task A - OS Command Injection Lab

 PHP app (through Docker) with intentionally vulnerable `ping.php` endpoint for OS command injection demonstration.

Quick Start
-------------------------
In Terminal:

1. docker compose -f ./docker-compose.yml build
2. docker compose -f ./docker-compose.yml up -d


-------------------------
open http://localhost:8080 in your browser.


Vulnerable Endpoint

URL: `http://localhost:8080/ping.php?host=<value>`
Vulnerability: Direct string concatenation into `shell_exec()`
Payload: `127.0.0.1;id`

Flags

- User: `/var/www/html/flags/user.txt`
- Root: `/root/root.txt` (requires privilege escalation)

 Privilege Escalation

SUID binary at `/usr/local/bin/rootshell` allows root escalation.

CLEANUP: docker compose down