<?php

require 'vendor/autoload.php';

use Spatie\Browsershot\Browsershot;

$html = '
<!DOCTYPE html>
<html>
<head>
  <title>PDF Test</title>
</head>
<body>
  <h1>Hello World</h1>
</body>
</html>
';

$pdf = Browsershot::html($html)
    ->newHeadless()
    ->setChromePath("/usr/bin/google-chrome-stable")
    ->setNodeBinary('/usr/bin/node')
    ->setNpmBinary('/usr/bin/npm')
    ->setNodeModulePath("/var/www/html/node_modules/")
    ->noSandbox()
    ->setOption('args', ['--no-sandbox', '--disable-setuid-sandbox', '--ignore-certificate-errors'])
    ->pdf();

header("Content-Type: application/pdf");
header('Content-Disposition: inline; filename=test.pdf');
echo $pdf;
