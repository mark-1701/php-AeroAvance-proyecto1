<?php
require_once("config.php");
require_once("controller/CorporateLoginController.php");
if(isset($_GET['m'])):
    $metodo = $_GET['m'];
    if(method_exists("CorporateLoginController",$metodo)):
        CorporateLoginController::{$metodo}();
    endif;
else:
    CorporateLoginController::login();
endif;
?>