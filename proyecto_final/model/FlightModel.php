<?php
class FlightModel{
    private $Modelo;
    private $db;
    private $index;


    public function __construct(){
        $this->Modelo = array();
        $this->db=new PDO('mysql:host=localhost;dbname=pfinal',"root","");
    }

    public function mostrar($tabla, $condicion){
        $consul='CALL getData("'.$tabla.'","'.$condicion.'");';
        $resu=$this->db->query($consul);
        while($filas = $resu->FETCHALL(PDO::FETCH_ASSOC)) {
            $this->index[]=$filas;
        }
        
        return $this->index;
    }


}
?>