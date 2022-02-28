<?php
  include_once 'connection.php';
  $idCompetition = $_GET['idCompetition'];
  $idBrewery = $_GET['idBrewery'];
?>

<!doctype html>
<html lang="en">
  <head>
    <title>Beer Challenge</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
  </head>
  <body>
      <div class="container">
          <div class="loginPanel pb-5 text-center">
            <form method="post" name="registration" style="max-width:600px;margin:auto;">
              <img src="beerChallengeLogo.png" height="200" alt="BeerChallenge Logo">
              <h1 class="h2 mb-3 font-weight-normal">Beer registration</h1>
                <input type="text" name="nameBeer" class="form-control mb-1" placeholder="Beer Name" required autofocus>
                <input type="text" name="alcohol" class="form-control mb-3" placeholder="Alcohol Rate" required autofocus>
                <h5>
                    <span>Beer Type :
                        <select name="beerType" class="form-control mt-2 mb-3">
                            <option value="">--Please choose an option--</option>
                            <option value="1">Blanche</option>
                            <option value="2">Weiss</option>
                            <option value="3">Golden Ale</option>
                            <option value="4">Lager</option>
                            <option value="5">Genesis</option>
                            <option value="6">Ipa</option>
                            <option value="7">Marzen</option>
                            <option value="8">Red Ale</option>
                            <option value="9">Stout</option>
                            <option value="10">Imperial</option>
                            <option value="11">Porter</option>
                        </select>
                    </span>
                </h5> 
                <input class="btn btn-dark btn-lg btn-block" type="submit" name="subscribe" value="Subscribe">
                <?php
                    if(isset($_POST['subscribe'])){
                        $nameBeer = $_POST['nameBeer'];
                        $alcohol = $_POST['alcohol'];
                        $beerType = $_POST['beerType'];
                        $control = false;
                        $query = "SELECT * FROM beer JOIN REGISTRATION WHERE name = '$nameBeer' AND idBrewery = $idBrewery";
                        $result1 = mysqli_query($conn,$query);
                        $alreadyRegistered = false;
                        if(mysqli_num_rows($result1) > 0){
                            if($row = mysqli_fetch_assoc($result1)){
                                $alreadyRegistered = true;
                            }
                        }
                        if(!$alreadyRegistered){
                            $query = "INSERT INTO beer (name, alcoholContent, idType, idBrewery) VALUES ('$nameBeer', $alcohol, '$beerType', $idBrewery)";
                            if(mysqli_query($conn,$query)){
                                $control = true;
                            }
                            else{
                                echo "<script> alert(\"Somethings gone wrong during registration\")</script>";
                            }
                            if($control){
                                $query = "SELECT MAX(id) AS idNewBeer FROM beer";
                                $result2 = mysqli_query($conn,$query);
                                if(mysqli_num_rows($result2) > 0){
                                    if($row = mysqli_fetch_assoc($result2)){
                                        $idBeer = $row["idNewBeer"];
                                    }
                                }
                                $query = "INSERT INTO registration (idCompetition, idBeer, date) VALUES ($idCompetition, $idBeer, now())";
                            }
                            if(mysqli_query($conn,$query)){
                                $control = true;
                                echo "<div class=\"bestPanel column text-center m-2\"> <h2 class=\"mb-1 font-weight-normal\"> Successfully registered! </h1></div> <div bestPanel column text-center p-5 m-5> <a href=\"homePage.php?idBrewery=". $idBrewery ."\"> Go back to Home page </a></div>";
                            }
                            else{
                                echo "<script> alert(\"Somethings gone wrong during registration\")</script>";
                            }
                        }
                        else{
                            echo "<div class=\"bestPanel column text-center m-2\"> <h6 class=\" mb-1 font-weight-normal\"> This beer has already participated in a competition! </h1></div>";
                        }
                    }
                ?>
            </form>
          </div>
      </div>
      
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>