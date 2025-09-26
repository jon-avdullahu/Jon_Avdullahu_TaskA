<?php


header('Content-Type: text/plain');

$host = isset($_GET['host']) ? $_GET['host'] : '';

$cmd = "ping -c 1 " . $host;

echo "[+] Running: $cmd\n\n";
$output = shell_exec($cmd . " 2>&1");
echo $output !== null ? $output : "(no output)\n";

