<?php
  include_once 'connection.php';
  $idBrewery = $_GET['idBrewery'];
?>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <title>Beer Challenge</title>
  </head>
  <body>
      <div class="container">
        <div class="navBar row justify-content-center bg-light"><img class="p-4" src="beerChallengeLogo.png">
        </div>
        <div class="bestPanel column text-center p-5 m-5">
            <h1>Best Brewery</h1>
            <?php
              $query = "SELECT brewery.name,COUNT(brewery.id) AS N_victory FROM result 
                        JOIN registration ON registration.id = result.idRegistration
                        JOIN beer ON beer.id = registration.idBeer
                        JOIN brewery ON brewery.id = beer.idBrewery
                        WHERE result.position = 1
                        GROUP BY brewery.id
                        HAVING N_victory >= ALL(SELECT COUNT(brewery.id) AS N_victory FROM result 
                        JOIN registration ON registration.id = result.idRegistration
                        JOIN beer ON beer.id = registration.idBeer
                        JOIN brewery ON brewery.id = beer.idBrewery
                        WHERE result.position = 1
                        GROUP BY brewery.id)";
              $result = mysqli_query($conn,$query);
              if(mysqli_num_rows($result) > 0){
                while($row = mysqli_fetch_assoc($result)){
                    echo "<h3>" . $row['name'] . "</h3>";
                }
              }
              mysqli_free_result($result);
            ?>
        </div>
        <div class="row justify-content-center p-5">
            <table class="table table-light">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Date</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <?php
                  $query = "SELECT id,name,date,deadline FROM competition ORDER BY date DESC";
                  $result = mysqli_query($conn,$query);
                  if(mysqli_num_rows($result)>0){
                    while($row = mysqli_fetch_assoc($result)){
                      echo "<tr>";
                      echo "<td>" . $row['name'] . "</td>";
                      echo "<td>" . $row['date'] . "</td>";
                      echo "<td><a href=\"graduatory.php?idCompetition=". $row['id'] ."\"><img src=\"podium.png\"></a>";
                      $deadline = new DateTime($row['deadline']);
                      $thisDate = new DateTime();
                      if($deadline < $thisDate){
                        echo "<img src=\"registration_red.png\"></td>";
                      }else{
                        $vars = array('idCompetition' => $row['id'], 'idBrewery' => $idBrewery);
                        $querystring = http_build_query($vars);
                        $url = "registration.php?" . $querystring;
                        echo "<a href=". $url ."><img src=\"registration.png\"></a></td>";
                      }
                      echo "</tr>";
                    }
                  }
                ?>
            </table>
        </div>
      </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>