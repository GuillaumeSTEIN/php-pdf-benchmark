<?php

require 'vendor/autoload.php';

use Dompdf\Dompdf;

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

// instantiate and use the dompdf class
$dompdf = new Dompdf();
$dompdf->loadHtml($html);

// (Optional) Setup the paper size and orientation
$dompdf->setPaper('A4');

// Render the HTML as PDF
$dompdf->render();

$dompdf->stream("sample.pdf", array("Attachment"=>0));
