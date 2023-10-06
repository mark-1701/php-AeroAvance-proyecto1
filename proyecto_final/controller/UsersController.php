<?php
require_once("model/UserModel.php");

class UsersController
{
    private $model;
    function __construct()
    {
        $this->model = new UserModel();
    }

    static function index()
    {
        $user = new UserModel();
        $dato = $user->mostrar("users", "1");
        require_once("view/users/index.php");
    }
    // INSERTAR
    static function nuevo()
    {
        require_once("view/users/nuevo.php");
    }

    static function guardar()
    {
        $type = $_REQUEST['type'];
        $name = $_REQUEST['name'];
        $email = $_REQUEST['email'];
        $password = $_REQUEST['password'];
        $state = $_REQUEST['state'];

        $data = "'$type', '$name', '$email', '$password', '$state'";
        $user = new UserModel();
        $dato = $user->insertar("users", $data);
        header("location:" . urlusers);
    }

    static function editar()
    {
        $id = $_REQUEST['id'];
        $user = new UserModel();
        $dato = $user->mostrar("users", "id = $id");
        require_once("view/users/editar.php");
    }


    static function update()
    {
        $id = $_REQUEST['id'];
        $type = $_REQUEST['type'];
        $name = $_REQUEST['name'];
        $email = $_REQUEST['email'];
        $password = $_REQUEST['password'];
        $state = $_REQUEST['state'];

        $data = "type = '$type', name='$name', email='$email', password='$password', state='$state'";
        $condicion = "id = $id";
        $user = new UserModel();
        $dato = $user->actualizar("users", $data, $condicion);
        header("location:" . urlusers);
    }



    // ELIMINAR
    static function eliminar()
    {
        $id = $_REQUEST['id'];
        $condicion = "id = $id";
        $user = new UserModel();
        $dato = $user->eliminar("users", $condicion);
        header("location:" . urlusers);
    }
}







?>