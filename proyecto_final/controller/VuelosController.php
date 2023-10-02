<?php

require_once 'model/vueloModel.php';

class vuelosController
{

    private $model;

    public function __construct()
    {
        $this->model = new VueloModel();
    }

    static function index()
    {
        // Muestra una lista de vuelos
        $origen = $_POST['desde_ubicaciones'];
        $destino = $_POST['hacia_ubicaciones'];
        $condicion = " Origen='" . $origen . "' AND Destino='" . $destino . "'";
        $vuelos = new VueloModel();
        $vuelos = $vuelos->mostrar('vw_vuelos', $condicion);
        require 'view/vuelos.php';
    }

    static function compra()
    {
        // Muestra una lista de vuelos
        require_once('lib/TCPDF/tcpdf.php');

        $vuelo = new VueloModel();
        $vuelo = $vuelo->datosvuelo('vw_vuelos', 1);

    
        $pdf = new TCPDF();

        // Establece el título del documento
        $pdf->SetTitle('Boleto de Avión');

        // Agrega una página al PDF
        $pdf->AddPage();

        // Colores personalizados
        $colorFondo = array(200, 230, 255);  // Azul claro
        $colorTexto = array(0, 0, 0);       // Negro
        $colorDestacado = array(0, 102, 204); // Azul

        // Establece el color de fondo
        $pdf->SetFillColor($colorFondo[0], $colorFondo[1], $colorFondo[2]);

        // Establece la fuente y el tamaño del texto
        $pdf->SetFont('dejavusans', '', 12); // Cambia la fuente a DejaVuSans

        // Información del boleto (esto debe ser dinámico en una aplicación real)
        $nombrePasajero = 'Juan Pérez';
        $numeroVuelo = 'Vuelo'.$vuelo['Id'];
        $fechaVuelo = $vuelo['Fecha'];
        $precioBoleto = $vuelo['Precio'];

        // Encabezado
        $pdf->SetTextColor($colorTexto[0], $colorTexto[1], $colorTexto[2]);
        $pdf->Cell(0, 10, 'Boleto de Avión', 0, 1, 'C');
        $pdf->Ln(10); // Salto de línea

        // Información del pasajero
        $pdf->SetFont('dejavusans', 'B', 16);
        $pdf->Cell(0, 10, 'Nombre del Pasajero:', 0, 1);
        $pdf->SetFont('dejavusans', '', 14);
        $pdf->Cell(0, 10, $nombrePasajero, 0, 1);
        $pdf->Ln(2);

        // Información del vuelo
        $pdf->SetFont('dejavusans', 'B', 16);
        $pdf->Cell(0, 10, 'Número de Vuelo:', 0, 1);
        $pdf->SetFont('dejavusans', '', 14);
        $pdf->Cell(0, 10, $numeroVuelo, 0, 1);
        $pdf->Ln(2);

        $pdf->SetFont('dejavusans', 'B', 16);
        $pdf->Cell(0, 10, 'Fecha de Vuelo:', 0, 1);
        $pdf->SetFont('dejavusans', '', 14);
        $pdf->Cell(0, 10, $fechaVuelo, 0, 1);
        $pdf->Ln(2);

        // Precio del boleto
        $pdf->SetFont('dejavusans', 'B', 16);
        $pdf->Cell(0, 10, 'Precio del Boleto:', 0, 1);
        $pdf->SetFont('dejavusans', '', 14);
        $pdf->Cell(0, 10, $precioBoleto, 0, 1);
        // Pasajeros del boleto
        $pdf->SetFont('dejavusans', 'B', 16);
        $pdf->Cell(0, 10, 'Asientos:', 0, 1);
        $pdf->SetFont('dejavusans', '', 14);
        $pdf->Cell(0, 10, $vuelo['Pasajeros'], 0, 1);

        // Genera el PDF y lo muestra en el navegador
        $pdf->Output();
    }
}
