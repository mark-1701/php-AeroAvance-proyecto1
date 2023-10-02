<?php
class VueloModel{
    private $Modelo;
    private $db;
    private $index;


    public function __construct(){
        $this->Modelo = array();
        $this->db=new PDO('mysql:host=localhost;dbname=pfinal',"root","");
    }
 
    public function insertar($tabla, $data){
        $consulta="insert into ".$tabla." values(null,". $data .")";
        $resultado=$this->db->query($consulta);
        if ($resultado) {
            return true;
        }
        else {
            return false;
        }
    }

    public function mostrar($tabla, $condicion){
        $consul="select * from ".$tabla." where ".$condicion.";";
        $resu=$this->db->query($consul);
        while($filas = $resu->FETCHALL(PDO::FETCH_ASSOC)) {
            $this->index[]=$filas;
        }
        
        return $this->index;
    }

    public function datosvuelo($tabla, $condicion){
        $consul="select * from ".$tabla." where ".$condicion.";";
        $resu=$this->db->query($consul);
        $data=$resu->FETCHALL(PDO::FETCH_ASSOC);

        $data=$data[0];
        
        return $data;
    }
}
?>