<?php
  include_once 'connection.php';
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
              <h1 class="h2 mb-3 font-weight-normal">Registration</h1>
              <input type="text" name="nameBrewery" class="form-control mb-1" placeholder="Name Brewery" required autofocus>
              <input type="text" name="address" class="form-control mb-1" placeholder="Address" required autofocus>
              <input type="text" name="website" class="form-control mb-3" placeholder="Web site" required autofocus>
              <h2 class="h6 mb-1 font-weight-normal">This will be used as credentials</h2>
              <input type="text" name="emailAddress" class="form-control mb-1" placeholder="Email Address" required autofocus>
              <input type="password" name="password" class="form-control mb-3" placeholder="Password" required autofocus>
              <input class="btn btn-dark btn-lg btn-block mb-5" type="submit" name="signUp" value="Sign Up">
              <?php
              if(isset($_POST['signUp'])){
                $nameBrewery = $_POST['nameBrewery'];
                $website = $_POST['website'];
                $address = $_POST['address'];
                $emailAddress = $_POST['emailAddress'];
                $password = $_POST['password'];
                $query = "INSERT INTO brewery (name, address, email, password, link) VALUES ('$nameBrewery', '$address', '$emailAddress', '$password', '$website')";
                if(mysqli_query($conn,$query)){
                  echo "<div bestPanel column text-center p-5 m-5> <h1 h6 mb-1 font-weight-normal> Successfully registered! </h1></div> <div bestPanel column text-center p-5 m-5> <a href=\"index.php\"> Go to login page </a></div>";
                }
                else{
                  echo "<script> alert(\"Somethings goes wrong during registration\")</script>";
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