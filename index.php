<?php
  include_once 'connection.php';
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
        <div class="loginPanel pb-3 text-center">
          <form method="POST" style="max-width:600px;margin:auto;">
            <img src="beerChallengeLogo.png" height="200" alt="BeerChallenge Logo">
            <h1 class="h2 mb-3 font-weight-normal">Please Sign In</h1>
            <input type="text" name="emailAddress" class="form-control mb-1" placeholder="Email Address" required autofocus>
            <input type="password" name="password" class="form-control mt-1 mb-1" placeholder="Password" required autofocus>
            <div class="mt-3">
                <input type="submit" class="btn btn-dark btn-lg btn-block" value="Sign in" name="login">
            </div>
            <div class="mt-2 mb-5">
                <a class="font-weight-normal">Not registered yet? </a><a href="signUp.php">Sign Up</a>
            </div>
            <?php
              if(isset($_POST['login'])){
                $email = $_POST['emailAddress'];
                $password = $_POST['password'];
                $query = "SELECT * FROM brewery WHERE email = '$email' AND password = '$password'";
                $result = mysqli_query($conn,$query);
                if(mysqli_num_rows($result) > 0){
                  if($row = mysqli_fetch_assoc($result)){
                    header("Location: homePage.php?idBrewery=". $row['id']."");
                  }
                }
                else{
                  echo "<script> alert(\"Email or password are wrong!\")</script>";
                }
                mysqli_free_result($result);
              }
            ?>
          </form>
        </div>
      </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>