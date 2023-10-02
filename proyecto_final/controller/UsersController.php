<?php
    require_once("model/users.php");
    
    class UsersController{
        private $model;
        function __construct(){
        $this->model=new Modelo();
        }
    
    static function index(){
        $user = new Modelo();
        $dato=$user->mostrar("users","1");
        require_once("view/users/index.php");
    }
        // INSERTAR
    static function nuevo(){
        require_once("view/users/nuevo.php");
    }

    static function guardar(){
        $type = $_REQUEST['type'];
        $name = $_REQUEST['name'];
        $phone_number = $_REQUEST['phone_number'];
        $email = $_REQUEST['email'];
        $state = $_REQUEST['state'];

        $data = "'".$type."','".$name."','".$phone_number."','".$email."','".$state."'";
        $user = new Modelo();
        $dato = $user->insertar("users",$data);
        header("location:".urlusers);
        }

        static function editar(){
            $id=$_REQUEST['id'];
            $user = new Modelo();
            $dato=$user->mostrar("users","id=".$id);
            require_once("view/users/editar.php");
        }


        static function update(){
            $id = $_REQUEST['id'];
            $type = $_REQUEST['type'];
            $name = $_REQUEST['name'];
            $phone_number = $_REQUEST['phone_number'];
            $email = $_REQUEST['email'];
            $state = $_REQUEST['state'];

            $data = "type = '$type', name='$name', phone_number='$phone_number', email='$email', state='$state'";
            $condicion = "id=".$id;
            $user = new Modelo();
            $dato = $user->actualizar("users",$data,$condicion);
            header("location:".urlusers);
        }



 // ELIMINAR
        static function eliminar(){
            $id = $_REQUEST['id'];
            $condicion = "id=".$id;
            $user = new Modelo();
            $dato = $user->eliminar("users",$condicion);
            header("location:".urlusers);
        }
    }



    



?>