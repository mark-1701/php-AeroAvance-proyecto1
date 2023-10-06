<?php
class LoginModel
{
    private $LoginModel;
    private $db;

    public function __construct()
    {
        $this->LoginModel = array();
        $this->db = new PDO('mysql:host=localhost;dbname=pfinal', "root", "");
    }

    public function authentication($table, $condition)
    {
        $query = "SELECT * FROM $table WHERE $condition;";
        $resu = $this->db->query($query);
        $user = $resu->FETCHALL(PDO::FETCH_ASSOC);
        // Verificar si se encontró un usuario
        if ($user) {
            return true; // Inicio de sesión exitoso
        } else {
            return false; // No se encontró al usuario o la contraseña no coincide
        }
    }
    public function insertUser($table, $data)
    {
        $query = "INSERT INTO $table VALUES(null, $data)";
        $result = $this->db->query($query);
        if ($result) {
            return true;
        } else {
            return false;
        }
    }

    public function updatePassword($table, $data, $condition)
    {
        $query = "UPDATE $table SET $data WHERE $condition";
        $result = $this->db->query($query);
        if ($result) {
            return true;
        } else {
            return false;
        }
    }
}
?>