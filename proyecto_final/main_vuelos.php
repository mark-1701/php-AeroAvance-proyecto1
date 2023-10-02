<?php
// index.php

require_once 'controller/FlightController.php';

$controller = new FlightController();

if(isset($_GET['action'])){
    $action = $_GET['action'];
    $controller->$action();
}else{
    $controller->index();
}