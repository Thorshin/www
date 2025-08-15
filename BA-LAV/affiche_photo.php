<?php
$src = isset($_GET['src']) ? $_GET['src'] : '';
?>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Photo</title>
  <style>
    body {
      margin: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      background: #000;
    }
    img {
      max-width: 100%;
      max-height: 100%;
    }
  </style>
</head>
<body>
  <img src="<?php echo htmlspecialchars($src); ?>" alt="Photo">
</body>
</html>
