<?php

require 'vendor/autoload.php';

use Knp\Snappy\Pdf;

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

$snappy = new Pdf('/usr/bin/wkhtmltopdf');

header("Content-Type: application/pdf");
header('Content-Disposition: inline; filename=test.pdf');
echo $snappy->getOutputFromHtml($html);

