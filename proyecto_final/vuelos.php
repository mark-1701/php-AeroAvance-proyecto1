<?php
require_once("controller/VuelosController.php");
if(isset($_GET['m'])):
    $metodo = $_GET['m'];
    if(method_exists("vuelosController",$metodo)):
        vuelosController::{$metodo}();
    endif;
else:
    vuelosController::index();
endif;
?>
