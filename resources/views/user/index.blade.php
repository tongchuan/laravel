!<!DOCTYPE html>
<html>
<head>
  <title></title>
</head>
<body>
  <table>
    <thead>
      <?php
        for ($i=0; $i < 1; $i++) { 
          echo "<tr>";
          foreach ($users[$i] as $key => $value) {
            echo "<th>$key</th>";
          }
          echo "</tr>";
        }
        ?>
    </thead>
    <tbody>
      <?php
      for ($i=0; $i < count($users); $i++) { 
        echo "<tr>";
        foreach ($users[$i] as $key => $value) {
          echo "<td>$value</td>";
        }
        echo "</tr>";
      }
      // echo var_dump($users);
      ?>
</tbody>
  </table>
</body>
</html>