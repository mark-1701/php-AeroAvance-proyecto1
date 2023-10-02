<?php
require_once("config.php");
require_once("controller/UsersController.php");
if(isset($_GET['m'])):
    $metodo = $_GET['m'];
    if(method_exists("UsersController",$metodo)):
        UsersController::{$metodo}();
    endif;
else:
    UsersController::index();
endif;
?>