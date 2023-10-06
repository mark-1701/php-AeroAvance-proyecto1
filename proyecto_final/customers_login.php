<?php
require_once("config.php");
require_once("controller/CustomersLoginController.php");
if(isset($_GET['m'])):
    $metodo = $_GET['m'];
    if(method_exists("CustomersLoginController",$metodo)):
        CustomersLoginController::{$metodo}();
    endif;
else:
    CustomersLoginController::login();
endif;
?>
