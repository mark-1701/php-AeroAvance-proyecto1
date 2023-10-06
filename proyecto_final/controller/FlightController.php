<?php
// controller/FlightController.php

require_once 'model/FlightModel.php';

class FlightController
{
    private $model;

    public function __construct()
    {
        $this->model = new FlightModel();
    }

    public function index()
    {
        // Muestra una lista de vuelos
        $origen = new FlightModel();
        $destinos = new FlightModel();
        $origen = $origen->mostrar('origenes', 1);
        $destinos = $destinos->mostrar('destinos', 1);
        require 'view/list.php';
    }

    public function showDetails()
    {
        // Muestra detalles de un vuelo específico
        require 'view/details.php';
    }

    public function book()
    {
        // Procesa la reserva de un vuelo
        require 'view/booking.php';
    }
}