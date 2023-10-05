<?php
class VueloModel{
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

    public function insertCompra($id,$idUser){
        $consul='CALL compra('.$id.','.$idUser.');';
        $resu=$this->db->query($consul);
        $data=$resu->FETCHALL(PDO::FETCH_ASSOC);
        $data=$data[0];
        return $data;
    }

    public function datosvuelo($condicion){
        $consul='CALL getDataVuelos("'.$condicion.'");';
        $resu=$this->db->query($consul);
        $data=$resu->FETCHALL(PDO::FETCH_ASSOC);

        $data=$data[0];
        
        return $data;
    }

    public function datosvuelos($condicion){
        $consul='CALL getDataVuelos("'.$condicion.'");';
        $resu=$this->db->query($consul);
        while($filas = $resu->FETCHALL(PDO::FETCH_ASSOC)) {
            $this->index[]=$filas;
        }
        
        return $this->index;
    }
}
?>