<?php require_once("model/LoginModel.php");

class CorporateLoginController
{
    private $model;
    function __construct()
    {
        $this->model = new LoginModel();
    }

    //FUNCIONES PARA CARGAR LAS PÁGINAS
    static function login()
    {
        require_once("view/corporate_login/login.php");
    }

    static function recoverPassword()
    {
        require_once("view/corporate_login/recover_password.php");
    }

    static function singUp()
    {
        require_once("view/corporate_login/sing_up.php");
    }

    //MÉTODO PARA EL LOGIN
    static function Acceder()
    {
        $email = $_REQUEST['email'];
        $password = $_REQUEST['password'];

        $data = "type='administrador' AND email='$email' AND password='$password'";
        $model = new LoginModel();
        $dato = $model->authentication("users", $data);
        if ($dato) {
            header("location:" . urlusers);
        } else {
            $mensaje = "Error al iniciar con esas credenciales.";
            require_once("view/corporate_login/login.php");
        }
    }

    //MÉTODO PARA RECUPERAR CONTRASEÑA
    static function Recuperar()
    {
        $email = $_REQUEST['email'];
        $newPassword = $_REQUEST['newPassword'];

        $data = "password='$newPassword'";
        $condition = "email='$email'";
        $model = new LoginModel();
        $dato = $model->updatePassword("users", $data, $condition);
        header("location:" . urlcorporatelogin);
    }

    //MÉTODO PARA REGISTRAR USUARIO
    static function Registrarse()
    {
        $name = $_REQUEST['name'];
        $email = $_REQUEST['email'];
        $password = $_REQUEST['password'];

        $data = "'administrador', '$name', '$email', '$password', 'activo'";
        $model = new LoginModel();
        $dato = $model->insertUser("users", $data);
        header("location:" . urlcorporatelogin);
    }
}
?>